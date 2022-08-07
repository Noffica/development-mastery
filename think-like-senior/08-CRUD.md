## Start thinking like a senior

#### 1. Why are there 7 RESTful actions when there are only 4 in CRUD?
(C)reate (R)ead (U)pdate (D)elete has its origins in databases, as a set of fundamental operations on records or data objects in _persistent storage_. REST is an architecture paradigm for API (resources and hypermedia via HTTP) [[1]](#1), which operates on representations of _resources_.

REST governs interactions within a system; its actions allow for multiple or complex operations to be performed, where one of which can be a CRUD operation, another can be a trigger for a process/job/validation etc. Hence the existence of additional RESTful actions such as `show`, `new` and `edit`.

As shown in the associated pull request, are _setting up_ resources (instantiating a _resource_ or loading in memory) as opposed to reading or writing to persistent storage. Generally, a Rails-based application will use a form on the UI to accept information which is then used to create or update a resource. This is a two-step process: there is an _action_ which results in the display of a form; secondly, there is _action_ which processes this form input (when the form is submitted). The `new` and `edit` actions present the form on the UI, as part of the process of creation / update of a resource. The form itself is not a resource proper, and no resource has yet been created/updated. The appropriate HTTP verb here is `GET`; however, `GET`ing a singular resource is already used in the `#show` action, `new` is assigned its own named route. Hence, we have `link_to("Create a new resource", new_resource_path)`. Similarly for `edit`. [[4]](#4)


#### 2. In detail, how do migrations work? Why do we need them?
_Database migrations_ are a tool used to make changes to the db structure/schema [[2]](#2). The intended changes are first defined in a standard `.rb` file

Each change is defined in the same Ruby/Rails DSL as the rest of the Rails-based application. The Object Relational Mapper (ORM) for SQL databases like MySQL, PostgreSQL or Object Document Mapper (ODM) for NoSQL databases like MongoDB serve as the interface with the db, and translates the Ruby syntax code to the appropriate db language commands.

**Order of changes made to the db schema**

Migration files are _versioned_: the filenames contain the timestamp based on time of creation; **however**, the order in which migrations are run, also recorded in the db, takes precedence. Migration 'A' created before migration 'B' but executed second would be recorded as such, and would be applied as such when the schema is re-created. This is one way conflicts are avoided. It should be noted that changes made to a past, applied migration can thus cause problems as the db will have already recorded the migration as applied, and will not re-apply; consequently, dependant changes will be impacted.

Thus the series of the _migration_ files serves as the entire step-wise history and sequence of all changes made to the db schema. Database schema can thus be imparted to other environments or machines with relative ease. As stated previously, since changes are defined in saved files (and generally _committed_ to code), they can be subject to _code reviews_ and serve as an _audit trail_ of changes.

_Migrations_ can also be used to revert to a past db structure (without manually executing every single, necessary db command).


#### Why do naming conventions matter when designing your routes?
This is part of Rails' philosophy of "convention over configuration", where following this convention allows Rails to perform many menial tasks e.g. a single line of `resources :articles` automatically becomes mapped to the `articles_controller#index` method and `articles/index` page for all `articles`; `#new` with the corresponding `new` page, and so on. There are no extra lines of code required to set up this mapping.


#### Why do we want to separate route definitions from request handlers?
In conjunction with Rails' convention, it allows separation of concerns and responsibilities. Over the course of development, as the size and complexity of the codebase (incl. that of controllers) increases, code can be easier to read, write and manage.


##### _References_
<a id="1">1.</a> [REST vs CRUD: Explaining REST & CRUD Operations](http://www.bmc.com/blogs/rest-vs-crud-whats-the-difference/)

<a id="2">2.</a> "Rails Crash Course" by Lewis, A. | No Starch Press | 2015

<a id="3">3.</a> [Rails migration - a complete guide](http://stackify.com/rails-migration-a-complete-guide/)

<a id="4">4.</a> "Rails 3 Way, The" by Fernandez, O. | Addison-Wesley Professional | 2010
