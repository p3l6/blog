---
title: C++
layout: reference
---

## Copy constructors
The copy assignment operator must clean up the data members of the assignment's target (and correctly handle self-assignment)

The copy constructor assigns values to uninitialized data members.
For example:
```cpp
My_Array first;           // initialization by default constructor
My_Array second(first);   // initialization by copy constructor
My_Array third = first;   // Also initialization by copy constructor
second = third;           // assignment by copy assignment operator
```

## Integer sizes
Integer sizes on 64 bit operating systems

* short  is 16 bits
* int  is 32 bits
* long is ?? bits
	* 32 on windows (LLP64)
	* 64 on unix, mac (LP64)
* long long is 64 bits
* prt/size_t  is 64 bits
