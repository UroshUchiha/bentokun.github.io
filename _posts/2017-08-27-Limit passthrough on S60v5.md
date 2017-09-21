---
layout: post
---

Between 2008 and 2010, Symbian 60 phones were very popular (because there hasn't been any Android phone around yet). Symbian development had been popular until middle of 2010. And although Nokia had put their effort so much on
userworkspace, it's too lateeee. Android has taken over and it makes more devs switch to Android, 'cause obiviously Symbian development is hard and its hardware is Nazi and mostly limited at that time, although Nokia tried to fix
their mistakes with the release of Qt for Symbian and Symbian Belle. Yes, that was what i read and what i conclude, because i was a little kidz at that time.

I have tried doing Symbian C++, and i couldn't even set up the project in Carbide C++, because there hasn't been any document around for setting up remote environment, so I had to set up a Windows XP virtual machine to use the 
emulator (x64 hasn't been supported). And doing Symbian C++ is very hard, so boii I quitt (but I will try again =)) )

Symbian 60 hardware by Nokia at that time is limited. There was 128 MB of RAM and not even a CPU. On S60v5, the max free ram was 55MB after booting. Limited RAM makes it difficult for game devs at loading resources. There is litterally no way to store lots of 3d Model without slowing the game down.
So it was a struggle. Hardware didn't enable great graphics. Lack of RAM and a simple GPU made lacks of OpenGL ES 2. But it enable great creativity from devs. 

To make sure there was a suitable amount of RAM left when running the game, optimized were done. Gameware Developments, the creator of Creebies, workaround by rendering most of the object as billboard. Texture as saved most as bmp, with 24 bit resolution. Why?
If you download a copy of the game and use SISContents to extract it, then do a little reserve engineering, you will see that in the objects.dat file, there are many file names. The file content is actually store in the cache, this file is just describe it properites in the cache, but actually we 
can see why they store most of them as bmp.

![File names in ASCII](/assets/reserve_creebies.png)

The first two bytes are mysterious, but the next 4 bytes is an little-endian uint32 that stored the count of files, or easier, tell you how many files are there. 

![4 bytes!! 76 07 00 00](/assets/reserve_creebies3.png)

If you convert the number to decimal, you will see that there are 1910 files, that is a lot =))

![Convert number!!!](/assets/reserve_creebies4.png)

But that is the long way =)) You could just use search and press Count =)) 

![Use search and count](/assets/reserve_creebies2.png)

You see, that's a lot of assets, not including model, map and sound. Cache are 23mb, zipped. 55 mb is not enough. So they had to optimized their game as much as possible. The files were optimized to BMP, and they doesnt not load all of file in once, but seperate it to a minimum, which can accpetable for performance.
Lots of model were pre-rendered or draw, then rendered as billboard like the technique use in The Sims (originale). Only some importances like the creebies or the house, also the island, are rendered as 3D model. That's a smart game design, that i want to learn to make my game in Symbian
works great. The core of the game is fun, actually =)) Here are some images that I think you would want to see

![Most stuff in the house are 3D. In a big environment, using billboarding is a great choice to hide weakness, but in a small environment like house, billboards make game looks ugly.](/assets/Scr000013.jpg)
<p>Most stuff in the house are 3D. In a big environment, using billboarding is a great choice to hide weakness, but in a small environment like house, billboards make game looks ugly.</p>

![Trees are billboard](/assets/Scr000014.jpg)
<p>Trees are billboard</p>

![Trees are billboard 2](/assets/Scr000015.jpg)
<p>Trees are billboard 2</p>

![Trees are billboard 3](/assets/Scr000016.jpg)
<p>Trees are billboard 3</p>

![Trees are billboard 4](/assets/Scr000017.jpg)
<p>Trees are billboard 4</p>

![Trees are billboard 5](/assets/Scr000025.jpg)
<p>Trees are billboard 5</p>

![In the arena, the land are rendered as a plane, and then textured flat, in order to optimized as much as possible. Player and oponent are 3D, still](/assets/Scr000021.jpg)
<p>In the arena, the land are rendered as a plane, and then textured flat, in order to optimized as much as possible. Player and oponent are 3D, still</p>
![](/assets/Scr000022.jpg)
<p>I'm gonna win =))</p>
![Store items are displayed as icons, with size about 32x32](/assets/Scr000024.jpg)
<p>Store items are displayed as icons, with size about 32x32</p>
