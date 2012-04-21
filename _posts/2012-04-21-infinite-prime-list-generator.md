---
layout: post
title: "Infinite Prime List Generator"
description: ""
tags: [sieve, eratosthenes, prime, number, generator, incremental, infinite, list, python]
---
{% include JB/setup %}

I was interested in implementing an incremental, infinite list of primes and came across this [paper][jfp].

Traditionally generating primes via [Sieve of Eratosthenes][sieve] involves crossing off all the multiples of prime *p* up to an arbitrary number *n*.

For an incremental list, cross off multiples of prime when evaluating the number rather than ahead of time. Afterwards, store the next composite number and the prime number back in the table. This emulates an iterator's behavior by storing the state of the prime multiples (composite number) and the step size (prime number).

For example, instead of eliminating all the multiples of 2 from an array of size *n*, store the first composite and step size (4,2) in the table. Progressing through the natural set starting from 2, any number not in the table is considered prime.

{% highlight python %}
def gen_prime():
    tbl = dict()
    i = 2
    while True:
        if i in tbl:
            pr = tbl[i]
            tbl[i+pr] = pr
            del tbl[i]
        else:
            tbl[i**2] = i
            yield i
{% endhighlight %}

I've stored the "iterator" as a key-value lookup in a dictionary. It's fairly straight forward at this point:

- If the number is in the table increment it.
- If not, add the composite number and prime number into the table, yield the prime.

A collision occurs when a composite number has more than one prime divisor. For example, 12 is divisible by both 2 and 3. The above code would store (12,3) in the table, only to be overwritten later on by (12,2). To solve this, I change the value store to a list and append to it if the composite number already exists. As a result, I need to modify the value evaluation behavior as well.

{% highlight python %}
def gen_prime():
    tbl = dict()
    i = 2
    while True:
        if i in tbl:
            pr = tbl[i]
            for p in pr:
                if (p+i) not in tbl:
                    tbl[p+i] = [p]
                else:
                    tbl[p+i].append(p)
            del tbl[i]
        else:
            tbl[i**2] = [i]
            yield i
        i += 1
{% endhighlight %}

No doubt this code can be further improved and optimized, but an infinite prime number generator can be useful as is.

[sieve]: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
[jfp]: http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
