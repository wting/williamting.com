Author: William Ting
Date: 2012-04-12
Title: Google Code Jam Prep
Tags: google, code, jam, python, c++, programming, contest, coding

Google [Code Jam](https://code.google.com/codejam) is kicking off in a day. I've participated a few times, always getting past the qualification round but usually getting bogged down in later rounds.

There are a few things one can do in preparation though.

## Programming Language

You can check out foxlit's [analysis site](http://go-hero.net/jam/) for more detailed information, but basically it boils down to the top 3 is C++, Java, and Python. I wouldn't worry about letting popularity affect your decision though, familiarity and speed developing with your chosen language is paramount.

Contests are more about solving problems efficiently-enough and fast implementation. Python tends to lead in the fast implementation category, but in later rounds when the large data sets get larger Python can run into run time limits. This is especially true if part of your solution is running in polynomial time or worse. Compiled languages may be able to get away with less efficient code.

## Skeleton Code Setup

The mechanics of most Code Jam problems is roughly the same. The input file contains:

- N test cases
- M miscellaneous constants
- data for M objects

Make sure you're set up to read and parse files in quickly. I've included some code snippets below.

### Python

I tend to prefer reading data through stdin when using Python.

    # read in number of cases
    cases = int(raw_input())
    for c in xrange(cases):
        # read in misc problem constants
        num_towns, num_employees = map(int,raw_input().split())

        # read in data
        data = []
        for i in xrange(num_employees):
            tmp = map(int,raw_input().split())
            data.append(tmp)

        # problem solving logic here

        # output answer
        print "Case #%d:" % (c+1),

### C++

Most people just include a plethora of standard libraries for commonly used data structures rather than worry about overhead, and some add in a lot of personal shorthand notation as well.

    // libraries
    #include <cmath>
    #include <cstdlib>
    #include <ctime>
    #include <cstdio>
    #include <cstring>
    #include <string.h>
    #include <sstream>
    #include <iostream>
    #include <iomanip>

    #include <algorithm>
    #include <complex>
    #include <deque>
    #include <list>
    #include <map>
    #include <queue>
    #include <stack>
    #include <set>
    #include <vector>

    // shorthand
    typedef vector<vector<int> > vii;
    typedef vector<int> vi;
    typedef vector<string> vs;
    typedef long long ll;

    using namespace std;

    typedef pair<int,int> p;
    p employees[1024];

    int main(int argc, const char *argv[])
    {
        string fname = "problem";
        freopen((fname+".in").c_str(), "r", stdin);
        freopen((fname+".out").c_str(), "w", stdout);

        // read in number of cases
        int cases;
        scanf("%d", &cases);

        // read in misc problem constants
        for (int i = 1; i <= cases; ++i) {
            int num_towns, num_employees;
            scanf("%d%d", &num_towns, &num_employees);

            // read in data
            int h, c;
            for (int j = 0; j < num_employees; ++j){
                scanf("%d%d", &h, &c);
                e[j] = make_pair(h, c);
            }

            // problem solving logic here

            // output answer
            printf("Case #%d:", i);
        }

        return 0;
    }

## Practice

Familiarity with common data structures and algorithms will help a lot. Practice always helps, just refer to past [contests](https://code.google.com/codejam/contests.html). If you ever get stuck on a question, just refer to the "Content Analysis" link on the contests page.

[TopCoder Algorithms](http://www.topcoder.com/tc?d1=tutorials&d2=alg_index&module=Static) is another good reference link to study.

## Final Words

Don't worry too much during the actual competition, get a rough idea on paper first before implementation, and try to have fun!
