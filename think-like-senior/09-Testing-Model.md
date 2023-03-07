# Tasks

## Start thinking like a senior
When can we skip testing in a project? Is skipping tests a form of technical debt? How could we spot the difference between debt and bad code? How does testing impact the design of our applications? What issues do slow tests cause?

Testing may be skipped when only boilerplate code is present. Another justifiable scenario is when a proof-of-concept (PoC) is being developed. Sometimes, in reality, there are unfortunate cases when PoC's turn into production-grade projects where tests are never added. Such cases would amount to "technical debt".

"Technical debt" and "bad code" may be differentiated by their nature: the former may be design / architecture decisions expedient for the moment but inefficient for the medium/long -term; the latter may be excessive or convoluted code.

Inclusion of testing would greatly encourage if not force maintainability and comprehensibility. E.g. convoluted relationships amongst different modules, objects etc. would be difficult to test; and vice versa.

If, however, tests are slow (or inefficient in other fundamental aspects) then maintenance of tests becomes de-prioritised by the development team. Tests which fail are ignored or silenced; which only grow in number with time. Eventually, the test suite becomes irrelevant.
