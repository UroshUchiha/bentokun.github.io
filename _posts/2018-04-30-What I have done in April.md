---
layout: post
comments: true
---

**April** is the month when I join some public projects. I don't have much experience in contributing so this was and is a
fun experience. This blog sums up what I have done on Github in the last month.

## EKA2L1: [Github](https://github.com/bentokun/EKA2L1)

EKA2L1 is my hobby project, targets to emulate Symbian OS 9.x and lower Symbian version. In the last month, I have done many
work that I haven't ever done before, or experience before. Here's all of them

- SIS Loader and Installer:

    * There is not much open sourced project that load the version 2 of SIS. Based on the document available online and Symbian Open Source, I have implement a loader and installer myself. There are some gaps and mystery in some part, which I have resolved and document in EKA2L1 wiki. It can extract data recursively from controller.

  ![s1](https://media.discordapp.net/attachments/431430722612363273/438709182649335809/Screenshot_from_2018-04-25_21-29-07.png?width=860&height=484)
  
    * Here is some cursed [music](https://cdn.discordapp.com/attachments/431430722612363273/438730689546813441/2000c4d4_musics.zip) from Bounce Touch
 that I was abled to extract from my own emulator :)
   
    * And in case, I hope you like my edgy humor from this video demonstrate the extracting progress 
    
    <iframe width="800" height="600" src="https://www.youtube.com/embed/6lrB2-X_F40">
    </iframe>
    
- Byte Pair Compression and Inflate Compression
 
    * Since EPOC was design in ancient time and Nokia won't bother much changing the algorithm since it will break compability, they reuse these annoying algorithm. I take the source and modify it to morden C++, simplify it. This brings much more speed, since the compression were using labels all the time.
    * Bringing those compression in also helps the progress of loading E32Image and ROM, ROFS in the future. Since E32Image depend heavily on them (SIS v2 did not since they use zlib's deflate/inflate)
    * [The documentation of Byte Pair Compression](https://github.com/bentokun/EKA2L1/wiki/Byte-Pair-Compression) can be found on EKA2L1 wiki
    
- E32Image Loading (EKA2)

    * While the documentation of E32Image ver1 is widely on the internet, not much of the version 2 is known. I have to dig into the code of [ELF2E32](https://github.com/fedor4ever/elf2e32) to figure out the header structure and all other things. Also, with the work of mrRosset's Engemu, I have been able to load the image into the memory. Still, stubbing is broken, and ROM Image still a mystery.
    
    * Currently, EKA2L1 supports both ver1 and ver2 of E32Image for N-Gage QD and 5800 EM.
    
    * Some tweaks on the thread design is making the CPU runnable, but since nothing is stubbed, things are just still a mess.
    
    ![Img2](https://media.discordapp.net/attachments/431430141319708692/439051654537674754/unknown.png?width=860&height=484)
 
 - Kernel
    
    * Basic kernel stuff is done now, but may not be right yet. The biggest kernel stuff that I made is the thread and thread scheduler. These are the core component of the emulator. Each thread has an unique heap, and a pointer to the data provided before run. Still, the core of the thread is implemented, it doesn't support the data yet.
     
     * Thread scheduler depends on the timing. However, i have only ran the core timing for testing, so yeah, i haven't finished it yet.
 
 - Symbols and stubbing design
     
     * While traditional emulator deals with extracting symbols then load them, EKA2L1 have the advantage of those function names are available. Instead of figure out the ROM structure and extracting export directory, the emulator have a tools to hash them into a 32 bit integer. The advantages are fast and all symbols are unique. If you don't want to use those symbols, then you can directly load the DLL image, which will be implement in the future.
     
     * The stubbing is still interrupt the CPU and get the symbol. But now the symbol is promised to be unique!
     
     * However, the hard problem here is those VTables and TypeInfos. I will move stubbing to a independent class call Stubber and working on it in next month
 
     ![lol](https://media.discordapp.net/attachments/431430141319708692/440343687575109632/unknown.png?width=860&height=484)
     
47 commits I made in April is [here](https://github.com/bentokun/EKA2L1/graphs/contributors?from=2018-04-01&to=2018-04-30&type=c)

## Vita3K [Github](https://github.com/Vita3K/Vita3K/)

I haven't worked much on Vita3K this month, I barely work on it (its the truth)

- Sfo Loading [#120](https://github.com/Vita3K/Vita3K/pull/120)
    * I implement the SFO loading. This brings the title ID to the window title!
    
- Filesystem [#183](https://github.com/Vita3K/Vita3K/pull/183)
    * Work in progress. Im really fond of what related to IO :)
    
 I'm lazy. Love you.
