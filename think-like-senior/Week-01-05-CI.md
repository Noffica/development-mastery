## Start thinking like a senior

### CI

#### What problems does CI solve?
Manual execution of each step in the series for the deployment of an application or service. This becomes repetitive, time-consuming and prone to human-error since the steps change infrequently.

The more complex an application, the more numerous the concerns for a successful (re-)deployment, incl. but not limited to build/compilation/transpilation, execution of tests, reload of related services etc. Each concern can be satisfied by inclusion as a step in the CI process.

Overall, as a whole, CI can act as a gatekeeper for all potential changes: if any step fails then the changes made to the codebase are withheld from what is deployed and operational.

#### How does CI solve the problem?
Automation.

A pre-defined act serves as the trigger for an automated, cascading series of pre-defined steps which result in the (re-)deployment application.

In the case of GitHub Actions, virtual, Linux-based Docker _containers_ are used, where the container used for a step is pre-loaded with the software packages needed by the user for that step e.g. a container for the db like PostgreSQL, another for hosting the backend application code in Ruby/Rails etc.
