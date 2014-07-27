---
layout: lesson
root: ../..
title: Nose: A Python Testing Framework
---

## Testing Frameworks

Each time we make changes to a code, we would like to test it. This can be tedious
and that might prevent us from testing.
We want to make testing as easy as versiion control is using git in the command line.
A testing framework can help us.


The testing framework we will discuss today is a python library called nose. However, there are
several other testing frameworks available in most languages. Most notably there is JUnit in
Java which can arguably attributed to inventing the testing framework.

### Nose

In nose, each test is a function whose name begins with the letters `test_`.
We can group tests together in files whose names also begin with the letters
`test_`. To execute our tests we run the command `nosetests`. This automatically
searches the current directory and its subdirectories for test files, and runs the
tests they contain.

### Applying nose to the range_overlap example

To see how this works, let's look at how we'd use it to test the range_overlap example.

Let's create a file test_range_overlap.py with nano:

~~~
$  nano test_range_overlap.py
~~~
{:class="in"}

<div class="in">
<pre>from ranges import range_overlap


def test_no_overlap():
    assert range_overlap([ (0.0, 1.0), (5.0, 6.0) ]) == None


def test_length_zero_overlap():
    assert range_overlap([ (0.0, 1.0), (1.0, 2.0) ]) == None


def test_single_range():
    assert range_overlap([ (0.0, 1.0) ]) == (0.0, 1.0)


def test_negative_range():
    assert range_overlap([ (0.0, 1.0), (0.0, 2.0), (-1.0, 1.0) ]) == (0.0, 1.0)</pre>
</div>

Let's run the tests:

~~~
$  nosetests
~~~
{:class="in"}

As promised nose searches for files starting with `test_` and runs functions called `test_`.
Nose writes a `.` for every successful test. Failed tests get a `F`. At the end we get a summary of
any failed tests.
This makes testing a single command. Easy to add to a `git add` & `git commit` sequence.
Of course, we still have to add tests before (or after) we add new functionality.


Stepping back, the most important part of this lesson isn't the details of the nose library. It's that
your time is more valuable than the computer's, so you should spend it doing the things computers can't, like
thinking of interesting test cases an what your code is actually supposed to do.

Nose and other libraries like it are there to handle all the things that you *shouldn't* have to re-think each time.

### Nose in numpy

All major projects use some kind of xUnit testing framework.
Let's look at testing of numpy:

~~~
$  nosetests numpy
~~~
{:class="in"}

We see a lot of tests. A few tests fail and a few tests are skipped. Skipped tests are marked with an `S`.

### Helpful tools in nose

Nose has some helpful tools. Let's take a quick look at them.

#### Assert functions

Nose defines a number of assert functions which can be used to test floating point numbers:

<div class="in">
<pre>from nose.tools import *


assert_almost_equal(a, b)
assert_
assert_true(a)
assert_false(a)
assert_is_instance(a, b)
</pre>
</div>

Numpy offers similar functions for testing arrays:

<div class="in"
<pre>from numpy.testing import *


assert_array_equal(a, b)
assert_array_almost_equal(a, b)
</pre>
</div>

#### Setup

More complicated codes require some setup for testing. For example you may need to read in sample data file as an array
and pass it to your test functions. Something we run our tests on is called a fixture.

If nose finds a function called `setup` in a test file it runs `setup` before any of the tests.
In the `setup` function we can create fixture and then use them for our tests.
