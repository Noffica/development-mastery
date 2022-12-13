## Start thinking like a senior

### When should we consider mocking or stubbing?
> “A mock is some object that represents a real object, for testing purposes.
> These are also known as test doubles.
> The mock stands in for an object
> However, a mock doesn’t touch the database–and thus takes less time to set up in a test.

> A stub overrides a method call on a given object, and returns a predetermined value for it
> In other words, a stub is a fake method which, when called upon, will return a real result for use in our tests.
> You’ll commonly use this to override the default functionality for a method, particularly in database or network-intensive activity.”

> “It’s only a fraction of a second here, but those fractions of seconds can build up over time–especially in more complex setup scenarios. Mocking is commonly used to reduce access to the database in cases like this.”

> “if you need to make a slow network call, or interact with a rate-limited external API, mocking can save you from the expense”

> “Unless things get very slow, or you need to test against data that is difficult to recreate (such as an external API or other web service”

Mocks (doubles) and stubs may be used whenever slow, complex or cumulatively time-consuming externalities are involved e.g. 
- a cumulative count of time consumed in accessing the database over the course of a test suite
- slow network calls, restrictive APIs (like rate-limited APIs) or other web services
- setup of complex required objects

### Besides mocks and stubs, what other option do we have to manage dependencies in our tests?
`Factories` is one option. Other ways are to use _hooks_ such as `before_all`, `before_each` (and the `after` equivalents). It's also imperative to write the purpose of each test section, sub-section and test in words which agree with the keywords of `describe`, `context` and `it`.

### What the difference between a controller/handler vs. a request test?
> Controller tests attempt to test the controller in isolation, and integration tests mimic a browser clicking through the app, i.e. they touch the entire stack.
> Honestly I only write integration tests. Controller tests are basically exactly the same thing but worse, and they are harder to write. You need integration tests anyway, to prove that what the users do will work! They are the only mandatory test IMO. They always touch controllers, so separate controller tests are totally redundant, and only useful in rare circumstances where the controller does something highly unusual.
> Also system tests in Rails are written exactly like integration tests, except they run on a full browser instead of the fast capybara simplified browser. These are the only way to test JavaScript features, but they are noticeably slower than integration tests and can be quite finicky. However, I prioritize them over integration tests now, because they really are the only way to know for sure.

> API only application

> For new Rails apps: we don't recommend adding the rails-controller-testing gem to your application. The official recommendation of the Rails team and the RSpec core team is to write request specs instead. Request specs allow you to focus on a single controller action, but unlike controller tests involve the router, the middleware stack, and both rack requests and responses. This adds realism to the test that you are writing, and helps avoid many of the issues that are common in controller specs. In Rails 5, request specs are significantly faster than either request or controller specs were in rails 4, thanks to the work by Eileen Uchitelle1 of the Rails Committer Team.
> - http://rspec.info/blog/2016/07/rspec-3-5-has-been-released/




    What status code should be used for validation errors?

