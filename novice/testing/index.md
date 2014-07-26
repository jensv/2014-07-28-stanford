---
layout: lesson
root: ../..
title: Testing
---

It's pretty obvious that if we want to be sure our programs are right, we need to put in some effort. What isn't so obvious is that focusing on quality is also the best way—in fact, the only way—to improve productivity as well. Getting something wrong and then fixing it almost always takes longer than getting it right in the first place. Designing testable code, practicing defensive programming, writing and running tests, and thinking about what the right answer is supposed to be all help get us answers faster, as well as ones that are more likely to be correct.

-  Testing can't find all mistakes, any more than proof-reading can find all typos, but both are still useful.
-  Use exceptions to report and handle errors: throw low, catch high.
-  Use an xUnit library to manage unit tests in a uniform, predictable way.
-  Isolating components for testing also improves code quality.
-  Use approximate comparisons when dealing with floating point numbers.
-  Separate test setup and teardown from test execution.

<div class="toc" markdown="1">

1.  [Defensive Programming](../python/05-defensive.html)

</div>
