## Start thinking like a senior

### When should we consider mocking or stubbing?
Mocks (doubles) and stubs may be used whenever slow, complex or cumulatively time-consuming externalities are involved e.g. 
- a cumulative count of time consumed in accessing the database over the course of a test suite
- slow network calls, restrictive APIs (like rate-limited APIs) or other web services
- setup of complex required objects

### Besides mocks and stubs, what other option do we have to manage dependencies in our tests?
_Factories_ is one option. Other ways are to use _hooks_ such as `before_all`, `before_each` (and the `after` equivalents). It's also imperative to write the purpose of each test section, sub-section and test in words which agree with the keywords of `describe`, `context` and `it`.

### What the difference between a controller/handler vs. a request test?
Request specs/tests allow for Controller _actions_ to be tested whilst also involving the router, middleware, the requests made and the responses received. This is more realistic and representative of the _real-world_ behaviour about the Controller. [[1]](#1)


### What status code should be used for validation errors?
- `400 Bad request` if the query is _syntactically_ incorrect e.g. `/user_id=` is called without a value for the `user ID` 
- `422 Cannot be processed` if the query is _logically_/_semantically_ incorrect e.g. `/user_id=-23`
- `404 Not found` if the request is syntactically and semantically correct but the entity does not exist e.g. `/user_id=23` where the user of ID `23` does not exist



#### _References_
<a id="1">1.</a> [RSpec 3.5 has been released](http://rspec.info/blog/2016/07/rspec-3-5-has-been-released/)