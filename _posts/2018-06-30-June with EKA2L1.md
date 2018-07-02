--- 
layout: post
comments: enable
preview: server2.png
---

Hi, I want to share with you what I have contributed to EKA2L1 in June. I have a lot of free time in summer, so I work part time on this, almost every night. Therefore, I have a lot of things to show you.

## 1. Console implementation
- This makes the example console app work. Basically, I sped things up, ignored Console IPC calls and overwrote them with my own implementation. 
- Fortunately, it runs, but the pipeline right now is really messed up. It calls for rendering every 2048 ticks, after down count (20 000 ticks) will reschedule thread. I don't expect it to manually do rendering, but I do it for the sake of displaying the console text.
- As you can see, it renders a console. The real console works by opening another DLL (image in Symbian calling), calling a function in the DLL. **CConsole** communicates with hardware to print terminal text through IPC calls. However, I was so unpatient to get it working, so instead, I overwrote the vtable, replaced the sixth entry (CConsoleBase::Write), with my own implementation, that put the text into OpenGL rendering list, and render all the console text each 2048 ticks. This behavior will be changed in the future, because the VTable entry of CConsoleBase::Write changes in various versions of Symbian.
- IPC, though, are implemented, and you can see details of implementation below.
- Here is the image of it running my console test. 
- ![Console](https://media.discordapp.net/attachments/431430141319708692/455664435717996544/Symbian.png?width=255&height=473)

## 2. Appveyor CI
- I integrated a CI to EKA2L1. It allows users (mostly on Discord), to download builds and test for me. And yeah, I fix many dumb things reported by testers (not many contributors right now) :D, shoutout to them <3.
- The hardest thing when implementing this CI is, I uses Lazarus UI. I will talk about GUI later, but there's no Lazarus Pascal provided. And the NewPascal supports only 32 bit. So I have to upload my own ver. However, the saddest thing is Lazarus will crash randomly (probably because of the memory on Appveyor).
- You can download artifacts from [here](https://ci.appveyor.com/project/bentokun/eka2l1-mjiuq).

## 3. The UI
- I don't have much experience in QT, and don't bother downloading 6GB just to make the GUI for now. When someone experienced with QT works with the GUI, I will switch to it. It has big advantages, considering I'm using C++ to write the core. 
- Here is the thin layer in Pascal. It's really easy to import :D, Pascal is actually useful sometimes.
- <script src="https://gist.github.com/bentokun/7d55361402977c987132d61fd60a5a92.js"></script>
- For now, I just made a thin DLL layer for it. I wrote a Pascal unit to import those core functions from the DLL.
- As now, the GUI is pretty usable. You can install, run things asynchronously. Here is a picture of it:
- ![GUI Picture](https://media.discordapp.net/attachments/431430141319708692/455663094807658497/Symbian.JPG?width=645&height=474)

## 4. IPC Mechanics
- The most important things that I have done this month in EKA2L1 is implementing IPC server and client. Some parts are extremely similar to 3DS and Switch, so I just referenced some code from Citra (sorry). But mostly, I implement it myself. 3DS's IPC has more sane then Symbian's IPC, just some parts are similar, like the property and storage buffer in Switch, or the IPC synchronous execution. 
- Let me explain these two mechanics. These may not be too accurate but its what I understand currently.

- ### A. IPC
   * IPC (Inter-process communication), is the way two processes communicate with each other. A process gives some specific request (call it client), through 
   IPC, that request is transferred to another process for processing (server).
   * In Symbian, it allows a user to send the function opcode with IPC args (TIpcArgs) through the *SendReceive / Send* functions. IPC arguments are either
   binary, text or integer (handle). The function opcode along with args are packed into a message, transfer to the correspond kernel server, which puts it
   in a waiting queue. When a process wants to get a message to dispatch and processing, it calls *Receive*. The message is taken from the waiting queue (accepted)
   , got accepted and transfer to the server process.
   * A session is a way of communication between client and server. We can send function op and args from session, and expect the server to receive them.
   * A diagram of this:
   * ![Diagram server](/assets/server2.png)
   * EKA2L1 implements something similar to this, but not as complex. The session and server is a kernel object. 
   And the session contains pointer to the responding server. When a message is sent, it calls the server function to put the message into the waiting queue.
   A message can be processed async or sync. If async, the messages will be processed each 40 000 ticks (maybe ?). Else it will be processed immediately.
   * However, an async request may not finish in only once call. I don't handle this yet, however, It's important to do so. For example, when a file opened with EFileReadAsync, It waits until a client drop the exclusive owning (only It can read or write), then continue reading. In that case, the async request should be put in a waiting queue.
   
- ### B. Property
    * Property is also IPC's way of reading and writing (publish) small constant data between processes. Property is a class contains either binary or integer data, shared 
	between processes.
	*  A thread/process can subscribe to the property. It means that when the property changes (deleted or changed), it will notify the thread, set the request status 
	to success.
	* Property is a Publish and Subscribe (P&B) mechanics.
	
- These core are all implemented in PR [#24](https://github.com/EKA2L1/EKA2L1/pull/24) and [#25](https://github.com/EKA2L1/EKA2L1/pull/25).

## 5. Dynarmic backend
- Dynarmic don't work properly with ARMv5, since it's unimplemented. However, it works really well with ARMv6 (Symbian^3 uses). Although Symbian^3 console can run, nothing graphics displays at the moment (SoonTM). 
- You can not enable Dynarmic yet. Maybe next month. Dynarmic backend implementation is in [#26](https://github.com/EKA2L1/EKA2L1/pull/26)

## 6. Server implementation (not merged, in [#30](https://github.com/EKA2L1/EKA2L1/pull/30))
- ### A. Window server 
   * Some window server sub-IPC calls are implemented. These includes: CreateScreenDevice and CreateWindowGroup. 
   * The window server is an example of an extremely nested design.
   * The window server has a root window. From that root window, you can create window group or top client window, etc...
   * A window group, as its name, is a class that contains a bunch of windows. Inside, there can be a top client window, which is
 window that can be drawed into the screen when there is a request to flush and draw the framebuffer.
   * A request to the window server will be redirected to the specified object in the request header. When the window server receives an IPC message that calls **EWservMessSyncMsgBuf** or **EWservMessCommandBuffer**, the first IPC argument will contains another tiny request header, which specified the tiny-op function number and the handle of the specified object to transfer this tiny request to. That object may be the screen device or group window. There will be a function in each object (CommandL), that handles these tiny ops.
   
- ### B. FS server
   * Implemented FS::Entry. It gets the info of entry (file, or directory).
   * RFile is a sub-session (Edit this as of July). A sub-session is a smaller version of a session, that is created by the session, and contains the actual session handle and the sub-session handle. 
   * The FS server manages its own file handles. When a **RFile::Open** or **RFile::Create** is called, the third IPC argument will contains a pointer to the descriptor, which should contain the file handle (aka sub-session handle). So when the call is finished, the third IPC argument should contain the file handle. From that moment, whenever it calls a RFile function, it will send an IPC message. The third IPC argument will contain the file handle. The fileserver (efsvr.exe) should be able to get the file node from the file handle and do its thing.
   * The 2 following picture should explain this easily:
   * ![ipc1](/assets/ipc1.png)
   * ![ipc2](/assets/ipc2.png)

## So now ..............
   
- There is nothing more to talk about, maybe in July. With this PR, it is now requested to get the file size (RFile::Size). It is getting closer everyday. The biggest advantage for me is that parts of Symbian Source are open-sourced, so I don't have many things to reverse engineer. 
It's just reading Symbian's code everyday to have illusion 100 in order to read what they actually wrote without hurting your head.

- Here is my [PaypalMe](https://paypal.me/Thi573) and my [Patreon](https://patreon.com/fewdspuck). Feel free to donate to this project if you like the progress so far and want to support me, every dollar is appreciated :D.

- I really love doing this. Even though things can get difficult, but eventually you figure it out step by step and implement it. While you wait for my next post, you should watch Todd Howard ASMR (my religion 🙏).

- <iframe width="560" height="315" src="https://www.youtube.com/embed/3uOPGkEJ56Q" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
