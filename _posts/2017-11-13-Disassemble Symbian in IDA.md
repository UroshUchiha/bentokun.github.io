---
layout: post
comments: true
---
I have a big interest in Symbian, for real. Since my childhood was playing Symbian games, especially Infinite Dreams games ^^, now I'm trying to reverse their games =))
That sounds weird, but i have a question about how they store their game data. Viewing the pak file when i was a child, i don't understand, and know i can't still :)), but
their storing method is fucking safe, really.

While the first 4 bytes in The Big Roll in Paradise identify the data type - PAK type, in another older games, the signature is not found. And there are no file names in
the pak, so reverse the file just by viewing the file hex is hard, so i have to use IDA.

Now what you are seeing is the disassemble of the symbian game **Super Miners**. There are many functions, and many of them don't have a names, just **sub** and **nullsub**
and **add** *bla..bla*. The code is huge, since this is a huge project. The game data information with file names are stored in the executable, with many names, which
makes me want to extract them ell lol =))))

![LOL0](/assets/dis0.png)

Surfing the disassemble chunk, i found that file names are stored in the files =) That's sad, cause there is no offset to be found :)) However, i had found an interesting 
functions, which looks similiar to everyone who knows CCCCC ......................

![LOL](/assets/dis2.png)

Yeah, it's smiliar to *printf*. Now let's talk a bit about Printf in Symbian. What if they used it to print some information to the console, since Symbian has a console instance ?? 
Although Symbian C++ provides a libc version, when they were working on the games, libc hadn't been released, i guessed (since P.I.P.S is available in
2006-2008 maybe :(), they make their version. But if this is not console printing ?? I thinks this is more like the logging function, but since i knows this function, i
gonna try to reversing the function using the pseudocode Hex-Ray generated. Just watch and we will see ;) I renamed it to printf for easy reference. 

![LOL2](/assets/dis3.png)

Now let's get to its definition

![LOL3](/assets/dis4.png)

OOHHH, a vardaric argument =)) If you do not knows the vardaric arguments, i suggest you to learn it by searching the **I N T E R N E T**, but i would try to explain it as
easy as possible if you haven't known it yett ^^ Basiclly, when you define the arguments with three dots **...**, you have defined a list of arguments, which size and type is unknown, until
we parse the functions. Therefore, to provide higher interface for userspace, easier to understand, for people to pass things they want on the function whichout arguments size
chains, complier provides vectors of argument. LOL let's get back to what i am doingg, shall we .-. You see, there is another function being called, with the same size of arguments, but
the vector is casted to a int pointer. This is the lower interface of the function we are talking about, let's name it printf_p :)

![LOL4](/assets/dis5.png)

When i look at the code, i was shock. WTF is this, for real .-. Lots of variables, which doesn't make sense, lots of functions with unknown name, and the dereferencing, substract and xor, it's
such a mess :( I think when you look in the code, you would be stupid like me tuu (if you don't then <3 ), but let's calm down and examine the arguments, from the easiest, the second argument.
- The second argument is a string, which indicates the format of the output, just like C
- The third argument is a vector of arguments, datas are going to be parsed in the format
- Now, the first argument is unknown, i will let you guess

Now, when we had examined the arguments, we are going to read the code. Variable declarations are ignored now, read some assign lines first =))

```c
v3 = a1;
v4 = a3;
v5 = a1;
v32 = a2;
```

v3 is assigned to the first argument, v4 is assigned to the third argument. v5 is assigned to the first argument and v32 is assigned to the second argument. Sounds easy right ?? Yeah, you are getting
used to it like me :) (I sound like a hoe tbh)

Scroll down a little bit and ...

![LOL5](/assets/dis6.png)

I have commented the code for you, but in case you don't understand (look at the code doesn't make you understand, for real), let's do some hexing lol =)))

![LOL6](/assets/dis7.png)

First, convert to hexadecimal value, then convert it to the text!!

![LOL7](/assets/dis8.png)

Now you get the character *%*. Do the same work for other character => get results like above :)

After you disassembling a while, you will find out how the function works. Of course it's not easy, but when we know just a little about its mystery, we
have fun, for real :). Since the time I wrote this, I have abadoned the disassemble file to switch to Snack and Creebies disassemble, I will let
you find about this yourself, and introducing you to Struct and Enum guessing in IDA, next part <3. For now, let's do some easy function like User Invariant
and some some things else :) Symbian C++ is a big and funny hybrid, although it's hard, but when you learn, your mind will be eveloped =))



