--- 
layout: post
comments: enable
preview: server2.png
---

Hi, I'm not lazy xD. Cut it off, just want to share with you what I have done in June with EKA2L1. I have a lot of free time in summer, as I
still a high school student and didn't really work part time anywhere, so I work part time in this, almost every night. So I have a lot of things 
to show you.

## 1. Console implementation
- This makes the example console app work. Basiclly, I speed things up, ignore Console IPC calls and overwrite with my own implementation. 
- Fortunately, it runs, but the pipeline right now is really messed up. It calls for rendering every 2048 ticks, after downcount (20 000 ticks) will
reschedule thread. I don't expect it to manually do rendering, but I do it for the sake of displaying the console text.
- As you see, it renders a console. The real console works by opening another DLL (image in Symbian calling), and calling ordinal X, which functions
implement by calling a Console Server
- Here is the image of it running my console test. 
- ![Console](https://media.discordapp.net/attachments/431430141319708692/455664435717996544/Symbian.png?width=255&height=473)

## 2. Appveyor CI
- I intergrated a CI to EKA2L1. As not many contributors right now, it allow users (mostly on Discord), download builds and test for me. And yeah,
I fix many dumb things from test by users :D, shoutout to them <3.
- The hardest thing when implementing this CI is, I uses Lazarus UI. I will talk about GUI later, but there's no Lazarus Pascal provided. And the NewPascal
supports only 32 bit. So I have to upload my own ver. However, the saddest thing is Lazarus will crash randomly (probally because of the memory on 
Appveyor).
- You can download artifacts from [here](https://ci.appveyor.com/project/bentokun/eka2l1-mjiuq).

## 3. The UI
- I don't have much experience in QT, and don't bother downloading 6GB just to make the GUI for now. When someone experiences with Qt work with the GUI,
I will switch to it. It has big advantages, considering I'm using C++ to write the core. 
- Here is the thin layer in Pascal. It's really easy to import :D, Pascal is actually useful sometimes.
- <script src="https://gist.github.com/bentokun/7d55361402977c987132d61fd60a5a92.js"></script>
- For now, I just make a thin DLL layer for it. I wrote a Pascal unit import those core functions from the DLL.
- As now, the GUI is pretty usable. You can install, run things asynchronously. Here is a picture of it:
- ![GUI Picture](https://media.discordapp.net/attachments/431430141319708692/455663094807658497/Symbian.JPG?width=645&height=474)

## 4. IPC Meachanics
- The most important things that I have done this month in EKA2L1 is implementing IPC server and client. Some parts are extremely similar to 3DS and 
Switch, so I just references some code from Citra (sorry). But mostly, I implement it myself. 3DS's IPC has more sane then Symbian's IPC, just some parts
are similar, like the property and storage buffer in Switch, or the IPC synchronous execution. 
- Let me explain these two mechanics. These may not be too accurate but is what I understanding briefly.

- ### A. IPC
   * IPC (Inter-process communication), is the way two processes communicate with each other. A process give some specific request (call it client), through 
   IPC, that requests is transfer to another process for processing (server).
   * In Symbian, it allow user sends the function opcode with IPC args (TIpcArgs) through the *SendReceive / Send* functions. IPC arguments are either
   binary, text or integer (handle). The function opcode along with args are packed into a message, transfer to the correspond kernel server, which puts it
   in a waiting queue. When a process wants to get a message to dispatch and processing, it calls *Receive*. The message is taken from the waiting queue (accepted)
   , got accepted and transfer to the server process.
   * A session is a way of communication between client and server. We can send function op and args from sesion, and expect the server to receive them.
   * A diagram of this:
   * ![Diagram server](/assets/server2.png)
   * EKA2L1 implements something similar to this, but not as complex. The session and server is a kernel object. 
   And the session contains pointer to the responding server. When a message is sends, it calls the server function to put the message into the waiting queue.
   A message can be processed async or sync. If async, the messages will be processed each 40 000 ticks (maybe ?). Else it will be processed imm.
   
- ### B. Property
    * Property is also a IPC way of reading and writing (publish) small constant data between process. Property is a class contains either binary or integer data, shared 
	between processes.
	*  A thread/process can subscribes to the property. It means that when the property change (deleted or changed), it will notify the thread, set the request status 
	to success.
	* Property is a Publish and Subscribe (P&B) mechanics.
	
- These core are all implemented in PR [#24](https://github.com/EKA2L1/EKA2L1/pull/24) and [#25](https://github.com/EKA2L1/EKA2L1/pull/25).

## 5. Dynarmic backend
- Dynarmic didn't work properly with ARMv5, since it's unimplemented. However, it works really well with ARMv6 (Symbian^3 uses). Although console Symbian^3
can be runned, nothing graphics display at the moment (SoonTM). 
- You can not enable Dynarmic yet. Maybe next month. Dynarmic backend implementation is in [#26](https://github.com/EKA2L1/EKA2L1/pull/26)

## 6. Server implementation (not merged, in [#30](https://github.com/EKA2L1/EKA2L1/pull/30))
- ### A. Window server 
   * Some window server sub-IPC calls are implemented. These includes: CreateScreenDevice and CreateWindowGroup. Read the Symbian OS Internal to understand
   these more. There is even more small IPC calls in CWsScreenDevice and CWsWindowGroup. Inside CWsScreenDevice, I implemented get Screen Size in pixels and twips
   
- ### B. FS server
   * Implemented FS::Entry. It gets the info of entry (file, or directory).

## So now ..............
   
- There is nothing much to talk now of these, maybe in July. With this PR, it is now requested to get the file size (RFile::Size). However, subsession are
unimplemented right now. It is getting closer everyday. I actually got headache because I have to analyze Symbian source. It's brainstorming, you must have
illusion 100 to read what they write in their code (its a meme, chill).

- Here is my [PaypalMe](https://paypal.me/Thi573) link. I notice that someone want to do one-time donation on Patreon. Here is my [Patreon](https://patreon.com/fewdspuck).
I really appreciate for even 1$ you pledged on Patreon.

- I'm really love doing this. Even though things are hard, but you figured it out and implemented it, you feel happy! So............. lol donate to my Patreon, i love money xD.
Meanwhile waiting for you to donate, I will watch Todd Howard ASMR. You can watch along with me.

- <iframe width="560" height="315" src="https://www.youtube.com/embed/3uOPGkEJ56Q" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


