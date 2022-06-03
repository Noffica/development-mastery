## Start thinking like a senior

### Track code quality

#### How does Code Climate track quality?
Code Climate runs static analysis on the codebase. The analysis is comprised of its "Ten technical debt checks" [[2]](#2) to measure _maintainability_ [[3]](#3).

#### What else did it track besides quality?
It also tracks test coverage. It receives test coverage data from wherever the tests are run [[1]](#1); e.g. the `codeclimate-test-reporter` Ruby gem sends a report (HTTPS POST) to CC on the lines of code executed for a test.

#### Why do you think this would have an impact on team culture?
A standardised analysis by a third-party on the quality of the codebase; along concerns of "duplication", "cyclomatic complexity", "cognitive complexity" and "structural issues" [[3]](#3) would help a team to improve its codebase. 

CC allows for objective standards (configuration of the analyses admittedly set by humans, and therefore never strictly "objective") to be set, which would be applied universally and automatically. 

As technical debt is controlled, overall, this would lead to an increase in productivity.


##### _References_
<a id="1">1.</a>
https://codeclimate.com/blog/test-coverage-and-code-quality-better-together

<a id="2">2.</a>
https://codeclimate.com/blog/10-point-technical-debt-assessment

<a id="3">3.</a>
https://docs.codeclimate.com/docs/maintainability