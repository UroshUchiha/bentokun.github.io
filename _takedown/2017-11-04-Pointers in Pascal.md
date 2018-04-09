---
layout: post
comments: true
---

Pascal is often known for its simplicity and clear syntax, and many
people does not know about memory operations in Pascal. It is not
easy, but it's very interesting and helpful, if you intend to do
big project with Pascal.

--------
## BASIC

Pointers in Pascal are the same as in C. To declare a pointer of type,
we have the following syntax:
	**type^**

To get an address of a variable, we type:
	**@variable**

And to dereference, we have the *^* operator:
	**^pointer**

This is also call as referencing to a type. For eg:

```pascal
var p: integer^;
    i: integer;

begin
	i :=5;
	p := @i;
	i :=12 + 5;
	
	writeln(^p);
end.
``` 

This will print 17 to the screen. Since p pointed to i, p wouldn't change, but the VALUE p
referenced to changed. That's i.

--------
## ADVANCE

In C, when we don't know the type we want to referenced to (for eg, parameter of funcs), we use
a void pointer (void*). In Pascal, it's *Pointer*. We can dereference it and cast it to another type,
since it's untyped.

For eg
```pascal
var a: Pointer;
    i: integer;

begin
	i:=5;
	a:=Pointer(i@);
	
	writeln(Integer(^i));
end.
```

This will print 5 to the screen.

Do you know the array type. Bascilly, when we declare the array type,
we had allocated variables which lies next to each other. To access every
element in the array in the pointee type, i have an eg:

```pascal
var a:array [1..100] of integer;
    pi: integer^;
    p2: Pointer;

begin
	a[1]:=5; a[2]:=10;a[3]:=15;
	pi:=@a[1];

	p2:=Pointer(pi)+15;	
end;
```

When we add pi with 15,basiclly, we add to int together. since basiclly,
Pointer is just a integer type, it will increase the address by 15 bytes.
So if a[1] address is 0x45234FFF, a[2] address will be 0x455234FFF + 15

To access a[2], we add pi with 1*sizeof(integer), which pass the a[1] bytes to
come to the beginning of a[2] bytes, just like C :)

```pascal
var a:array [1..100] of integer;
    pi: integer^;
    p2: Pointer;

begin
	a[1]:=5; a[2]:=10;a[3]:=15;
	pi:=@a[1];

	p2:=Pointer(pi)+sizeof(integer);

	writeln(Integer(^p2));	
end;
```

The result is 10. :)