---
layout: page
---

# SNACK-LANG PROJECT
Sources: <https://github.com/bentokun/snack>

## What is Snack??
- Snack is like a both scripting and programming language, generated
bytecode with LLVM or its own asm generator.
- Basiclly, Scripting language that uses LLVM as backend, compiled code, JITing or Intepretering. 
Has the ability to generate fully dynamic reflection by a post-precessor

![Design](https://github.com/bentokun/snack/raw/master/design.png Design)

## Why is created Snack?
- I need a language to scripting, and I want to challenge myself.
- I could use C++, but i have to write a reflection parser tool, or i could
use a lib,but i don't want to. Kiddd

## Example

```python
#Snack Programming Language
#Copyright (C) 2017 dotrongthu
#Copyright (C) 2017 LLVM Project

using 
	std,
	math;

$def a(x) std::cout << x

#Basic

#Type specifed with the formula: *var* as *type* = *intialize_val*; 

str_ha = 'string'           #When there is no colon expected, the parser intended it's one line only. Any statement expect comment will be marked as error
is_true = 2 <> 5.4;   #When there is colon, many statements can be inserted. Statements after a comment will be considered as comments

func max with a as int, b as int: int; 
bg
	if a > b 
	bg
		ret a;
	end
	elif b > a
	bg
		ret b;
	end

	ret 0;
end

type integer as u32;

class p6 with
bg
	public a as integer;
	public b as integer 
	bg
		get bg ret a; end;
		set bg a = value; end;
	end
end

a("Hi, I'm a scirpt!");

```
## Using the complier:
- Compile the code using MSVC15
- Run the executable with command line prompt with the last agrument as filename and other arguments as options
- Options list:
	* -e: Stop at the preprocessing step and print the result to the standard i/o. If there is no compiling option, the complier does it normals.
- For ant compliers, generate the makefile using cmake with the cmakelist file given.
- The code is extremely ugly and unoptimized right now.


## Links:
[Complier](https://github.com/bentokun/bentokun.github.io/raw/master/files/Snack.exe) : The complier itself

[Example 1](https://github.com/bentokun/bentokun.github.io/raw/master/files/script.sn): A marco example

[Example 2](https://github.com/bentokun/bentokun.github.io/raw/master/files/script2.sn): A syntax and operator example