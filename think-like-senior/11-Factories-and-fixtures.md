## Start thinking like a senior

### When is it better to use factories vs. fixtures or both?
_Factories_ afford greater flexibility when creating **dynamic** (test) **data**; as individual attributes, associations and behaviours can be customised for the scenario. This can be particularly useful when complex data structures need to be setup.

Since _factories_ are based on code, how they accomplish setup of test data can also be accessed and understood.

On the other hand, _static_ test data is better suited as _fixtures_. Rather than be executed and processed like code, they can simply be pre-loaded into the database or imported as is. This, of course, is faster.

Similarly, _fixtures_ can comprise specialised data which pertains to the database e.g. data for test scenarios around database constraints, triggers/conditions, unique behaviours etc.

**TL;DR**: _Factories_ and _fixtures_ can be complimentary since they provide their distinct benefits; _factories_ for dynamic test data; _fixtures_ for static.

### What test day should we use for third party apis?


### What kinds of systems or features do we need to have a higher confidence in the correctness of our tests?
- Define purpose/objective of each test
- Tests as _living documentation_ for unit tests and integration tests (e.g. API tests)
  - APIs, and their tests, conform to a standard
- Use of _mocks_ and _stubs_ to limit interaction with externalities, and thereby maintain a strict focus, independence and self-sufficiency for each test 
- Management of test data
- Management of test environments: internal test environments, production-like environments, environments for integration with third-parties etc.
- Monitoring and reporting of test results: pass/fail, coverage, performance etc.
- Maintenance of tests
