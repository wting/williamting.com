---
layout: post
title: "Infinite Prime List Generator"
description: ""
tags: [sieve, eratosthenes, prime, number, generator, incremental, infinite, list, python]
---
{% include JB/setup %}

I was interested in implementing an incremental, infinite list of primes and came across this [paper][jfp].

Traditionally generating primes via [Sieve of Eratosthenes][sieve] involves crossing off all the multiples of prime *p* up to an arbitrary number *n*.

For an incremental list, we cross off multiples of prime when evaluating the number rather than ahead of time. Afterwards, we store the next composite number and the prime number back in the table. This emulates an iterator's behavior by storing the state of the prime multiples (composite number) and the step size (prime number).

For example, instead of eliminating all the multiples of 2 from an array of size *n*, we merely store the first composite and step size (4,2) in our table. Progressing through the natural set starting from 2, any numbers not already in the table are primes.

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

It's fairly straight forward at this point. I store the "iterator" as a key-value lookup in a dictionary. If the number is in the table I increment it. If not, I yield the prime number and add the next multiple of the prime back into the table.

The problem occurs when there's a collision of a composite number from two different primes. For example, 12 includes both primes 2 and 3 as divisors. The above code would store (12,3) in the table, only to be overwritten later on by (12,2). To solve this I store the step as a list and append if it exists. As a result, I need to parse all the steps when coming across an composite in the table.

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

No doubt this code can be further improved and optimized, but the infinite prime number generator can be useful in certain situations as is.

[sieve]: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
[jfp]: http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
