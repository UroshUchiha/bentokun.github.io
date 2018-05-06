---
layout: post
comments: true
---

Stubbing was a pain in the ass for EKA2L1. Because everything, even system call, is pure C++. No C at all. Therefore, you have to
deal with vtables, typeinfos and other OOP things: pure virtual, non-virtual thunk, ABI, ... Either you choose to emulate system call
or the kernel library, you will have to go through all of these problems. Even in EKA2L1, I can't denined it. OpenGL ES can be wrapped
easily, but wrapping N3D (A Nokia 3D Renderer), is nothing but pain (you can try looking for the DLL, it is installed along with Bounce Boing
Vogage, also see the engine by Rovio page [here](https://web.archive.org/web/20080131225709/http://www.kajala.com:80/ka3d/) (I dig for the HGR format a while so I know this website).

While seeing other emulators did a quick hack on this, I think I can improve accuracy to the stubbing system. There are reasons why it's suitable and improvable:
  1. **We have the signatures**: Extract it from the SDK legally, we can have a list of signatures for each Symbain platform.
  Currently, there is signatures for epoc9 (since I'm lazy to unpack)
  2. **We have the declaration**: Interface class and headers are public available via SDK. This can helps us create typeinfos and vtables
    
Therefore, I decided to take a unique approach. Documented here (**state: UNFINISHED**) :

## I. Building the database
- To build the signatures, I make a tools to parse IDT file and convert in to YAML. IDT files can be found in IDA, or generate through
    ar2idt utility by IDA.
         * For each library, list all exports and its ID.
- The ID here is unique for each export.
     * Take the export function/description, remove all spaces, all qualifiers, only left the types and names, lowercase then hash them
     * This have two advantages:
         - Don't have to look for symbols in Symbian image
         - Provide uniqueness
- To build the metadata list, I use LibClang, which generates class entries and its properties (all base class, function attributes, ..)
- Two files are named: db.yml and meta.yml (smiliar to Vita database)

## II. Stubber
- Now its time for stubbing structure. The base class for all stub is '''stub''' (yep, that easy)
- A Stub has a unique ID, and a description of what it does. There is also a virtual method *write_stub()*, which writes stub into memory
- From the base class Stub, there are multiple Stubs type. Typeinfo_Stub, Vtable_Stub, Ordinial_Stub, Ptr_Stub, ... etc.
- To load a library, module, the stubber first:
    * Read the db.yml, write all function export stubs, leave behind typeinfo and vtable
    * For each entry read, the stubber parse the description, find all class referenced and stored them in two containers: one
  is class_stub and one is a container of string to look up later.
    * Then, read the meta.yml, find all base class and base attribute (virtual or not) and function entries
    * Based on the meta read, the stubber creates a vtable. This VTable is emulated to be as close to GCC Vtable as possible.
 - The Vtable is the only thing that prevent me from progressing, since building it is hard.
    * The VTable builder will recursively build a Vtable for base class until it meets a non-based one (pure soul). That means, if
    it meets a class that is not base on anything, it will creates a vtable for that class and store it in cache
- Typeinfo should be built easily. When we had written the helper pointer and name, we only have to write the pointer of the parent 
typeinfo

## III. Assembly and thunks
- Assembly for stubbing is handled. Stubbing for HLE calls is made by writing a svc (swi) interrupt call and mov call that includes the function id.
- As for non-virtual thunk, I do it by writing a sub call that subtract the class size, then jump to actual method. 

## IV. EABI emulation
- EABI emulation is not done yet. I don't even think properly about it. However, I have already created a class-type_info-like for EKA2L1, which can be seen [here](https://github.com/bentokun/EKA2L1/blob/master/src/emu/core/include/core/abi/eabi.h#L10)

The writeup here is unfinished and maybe incorrect. If you have any questions, you can contact through my Discord (Disquis comments won't work in Vietnam I think). 

You can also follow my work on Stubbing [here](https://github.com/bentokun/EKA2L1/blob/master/src/emu/core/src/loader/stub.cpp). Thanks for reading !
