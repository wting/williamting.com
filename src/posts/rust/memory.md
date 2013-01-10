Author: William Ting
Date: 2013-01-06
Title: Rust's Boxes and Pointers
Tags: pointers, memory, boxes
Status: draft

Rust's optional garbage collector and emphasis on memory safety has lead to a
three pointer types that mimics C++11's [unique_ptr, shared_ptr, weak_ptr][c11].

A quick overview:

- `&` references an object.
- `*` dereferences a pointer.
- `@` is a local heap pointer, shallow copy.
- `~` is an exchange heap, unique ownership pointer that allows deep copy.
- No `->` operator, left side of a period is automatically dereferenced.

Starting with the most basic use case:

<pre>
fn mem_stack() {
	// allocate on the stack
	let mut x = 1;
	let mut y = x;

	x += 1;
	assert x == 2;
	assert y == 1;
}
</pre>

Typical stuff.

[c11]: http://en.cppreference.com/w/cpp/memory
