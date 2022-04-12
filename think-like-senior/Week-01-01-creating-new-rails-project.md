# Start thinking like a senior

## RSpec
### Battle-tested
Yes. RoR has been in use for production-ready applications for many years now, and RSpec is its most prominent (BDD/TDD) testing tool in light of its statistics of usage [[1]](#1) and volume of published material such as books etc.

----

### Costs and training
$0 monetary cost of installation and use.

RSpec offers its own DSL, which does necessitate training; however, it is approachable, which also applies to its documentation. Additionally, training material for RSpec is widely available.

Therefore, overall, the cost (in terms of time) for training may be considered reasonable.

----

### Hiring pool
Based on the stats of usage of testing tools in the realm of RoR, RSpec and Minitest account for virtually all usage: 591M vs. 487M respectively [[1]](#1). Thus RSpec can be assumed to be part of the skillset of half of RoR developers.

✔ Summary: large pool amongst RoR developers.

The question of the state of the hiring pool of RoR developers is answered as follows.

It is limited [[2]](#2). New or junior developers are trained with either more syntactically strict, statically-typed languages such as Java/C# or approachable, scripting-friendly, general purpose languages which are also in extensive use outside of commercial software development such as Python. This is a contributor to the latter's popularity [[3]](#3).

In comparison, Ruby accounts for 7.89% of developers to Python's 41.53%; RoR at 7.89% to Django's 13.02%.

----

#### Initial and continued training for RoR
This can be considered to be low-medium due to its shared fundamental nature with Java, C# and Python as an OOP. Moreover, it is closely related to Python in syntax and technical characteristics such as being an _interpreted_ language.

Training time/costs can be quite nominal for personnel with a background in Python. In comparison, a transition from Java/C# will be more costly in relative terms but can be expected to be still low due to Ruby's significantly simpler syntax and barrier to entry (ease of use in setting up the development environment and writing executable code).

This low barrier to entry should also keep costs low for people new to software development.

----

### Maintenance and support
✓ [`rspec-core`](https://github.com/rspec/rspec-core/pulls?q=is%3Apr+is%3Aclosed) and [`rspec-rails`](https://github.com/rspec/rspec-rails/pulls?q=is%3Apr+is%3Aclosed) are under active, open-sourced, community-driven maintenance as can be seen from the frequency of continued commits and pull requests and stats compiled by Ruby Toolbox [[4]](#4):

|     | Downloads | Stars on GitHub | Latest release  |
| --- | ---       | ---             | ---             |
| [RSpec](https://www.ruby-toolbox.com/projects/rspec) | 591M | 2839 | 2022-02-09 |

----

### Scalability
Since this is a testing tool or framework, and not part of the functionality of a RoR application, scalability is a non-concern from a business perspective.

However, from the perspective of development tools, it can become a concern once the system reaches _medium_ to _large_ size (richer DSL, more helper functions, abstractions, layers and thus complexity). It can perform worse than MiniTest at scale; hence requires greater attention to architecture and setup.

A tool such as [rspec-benchmark](https://github.com/piotrmurach/rspec-benchmark) may help in measurements of performance.

----

### Alternatives
As stated previously, in light of the stats of usage, [MiniTest](https://github.com/seattlerb/minitest) and much less so [TestUnit](https://github.com/test-unit/test-unit) are the other prominent, open-source, equally maintained, mature alternatives.

----

#### _References_
<a id="1">1.</a>
[Ruby Toolbox Testing Frameworks](https://www.ruby-toolbox.com/categories/testing_frameworks)

<a id="2">2.</a> [Stack Overflow Developer Survey 2021: Web Frameworks](https://insights.stackoverflow.com/survey/2021#section-most-popular-technologies-web-frameworks)

<a id="3">3.</a> [Stack Overflow Developer Survey 2021: Programming, scripting, and markup languages](https://insights.stackoverflow.com/survey/2021#section-most-popular-technologies-programming-scripting-and-markup-languages)

<a id="4">4.</a> [Ruby Toolbox Testing Frameworks: table](https://www.ruby-toolbox.com/categories/testing_frameworks?display=table&order=score)



****
----


## PostgreSQL
### Battle-tested
Quite. It has been in extensive use in open-source, as well as prominent large-scale enterprise and non-enterprise applications for many years now. [[5]](#5)

----

### Costs and training
Due to the now decades-long prevalence of (SQL and) PostgreSQL, training material is abundant [[6]](#6). Therefore, cost of training can be considered nominal.

Cost of acquisition of the technology is $0 as it is open-source. However, of course, there is a cost of hosting / renting a PostgreSQL instance. Due to the proliferation of PostgreSQL, there are many service providers, and therefore, the cost is reasonable compared to alternatives to PostgreSQL.

----

### Hiring pool (developer-users)
Large. Magnitude of effort required to find talent: low.

----

### Maintenance and support
Extensive and well-established.

----

### Scalability
A nominal concern. See [[5]](#5)

----

### Alternatives
Abundant. MySQL and SQLite for SQL databases; MongoDB for no-SQL (~3900 stars on GitHub for Ruby interface [[7]](#7)).

----

#### _References_
<a id="5">5. </a>[PostgreSQL :: Notable users](https://en.wikipedia.org/w/index.php?title=PostgreSQL&oldid=1076044937#Notable_users)

<a id="6">6. </a>[PostgreSQL :: Documentation :: Quick Links](https://www.postgresql.org/docs/)

<a id="7">7. </a>[Mongoid on GitHub](https://github.com/mongodb/mongoid/)
