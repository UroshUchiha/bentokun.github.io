---
layout: page
---

## MARCO

**TRAPD(TInt, TFunction)**: This marco traps error from function and save it in a TInt number
	For example, when we create a new console (console = Console:NewL(title, TSize)), it will return an TInt as error.
	But saving the number is not easy, we have to caculated about exceptions in Symbian, adn use trap variable, which is hard. 
        To be easy, just use TRAPD. 

## FUNCTION

**CleanupStack::PushL**: push a heap pointer into the stack.

 
**CleanupStack::Pop**: pop a heap pointer from the stack.	

Use those twos in a function where there is a possibilty of leaving, making allocated pointer unfree and cause memory leak. CleanupStack is a stack that auto cleans the
pointer pushed in it in the end of E32Main

## SYNTAX - OPERATOR

**new (ELeave)**: allocate and intilaize memory, then leave if allocate failed
