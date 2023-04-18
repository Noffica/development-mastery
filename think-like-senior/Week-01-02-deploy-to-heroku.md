# Start thinking like a senior

## Heroku

### Dyno
The sandboxed environment (collection of _container_'s) on Heroku, which hosts the app code and dependencies, with its own resources of computation power, memory, OS and an ephemeral file system [[1]](#1). On Heroku, these _containers_ are virtual Linux environments.

### Advantages and Risks of deployments from CLI
**Advantages**
- Security
  - Absence of a UI layer is one less layer on which to expend significant resources for security
- Productivity or user-efficiency
  - The lack of a UI precludes any loss of time or confusion due to design
  - Commands (actions) can be run in parallel or in serial sequence
  - Commands and whole workflows can be automated at the user level
  - Less cognitive distraction and context-switch due to the ability to use the same CLI tool used throughout development

  **Disadvantages**
  - Steeper learning curve due to obvious lack of visual hints
  - High impact of trivial mistakes
    - The overall magnitude of input required (many key presses on the keyboard vs. fewer clicks of the mouse) is greater and may also require complete accuracy in order to execute
    - Spelling errors may result in failed commands or worse, an unintended or destructive action
    - Absence of visual differentiation can lead to misplaced commands e.g. execution of a destructive command in production vs. test environment

### When is Heroku ill-suited?
- When there is need for low-latency
- ... immediate or always-on availablity
- ... the application/service reaches _medium_/_large_ size. Heroku's cost, which can be an order of magnitude more than AWS, exceeds the costs saved by delegating infrastructure work to Heroku
- When infrastructure needs cannot be met by the finite number of add-ons or configuration presets available on Heroku

### Issues in production - discovery and resolution
#### Easiest checks
`.slugignore`:
- Build issues due to `.slugignore`: Check that Heroku's equivalent of Git's `.gitignore`, where Heroku ignores the mentioned files and directories, does not contain the required files/directories [[2]](#2)

Upstream service provider:
- Is there an issue with the upstream provider or host? What does https://status.heroku.com say? IF so then one has little choice but to wait.

Code or environment delta:
- Does reversion to the previous deployment resolve the issue? If there is a test/staging/development server of the same infrastructure then is that online and functional? Can the test environment and production be brought to parity to help diagnose the issue?

Logs:
- Do Heroku's logs (`heroku logs --tail`) offer any insight? Can add-ons for logging be used e.g. `papertrail`? Add-ons which offer e-mail notifications upon exceptions? Since a _dyno_ on Heroku is sandboxed, it may not be possible to SSH into one.

Data availability such as user sessions and "session affinity" [[3]](#3):
- Since Heroku's _dyno_'s are isolated from one another, storing data in memory can cause issues of availability of data IF the application runs on multiple dynos. E.g. if a user can only see some data once logged in then IF a subsequent request reaches a different dyno than the one on which processed the user's log-in, the user may not see the desired response.

#### Buildpacks: 
A **buildpack** is the component of Heroku which sets up the environment for the application: dependencies, assets etc. Buildpacks, which are open-source, can be forked and modified to include lines of debugging code; these can be as simple as `print` statements. [[2]](#2)

#### Automated tests
Are there any automated tests which run on Production? IF so then have any failed?

#### Permissioned error-pages
IF the app's functionality is based on types of users then can pages be setup such that the _admin_ user sees a stacktrace when an error is encountered **and** a normal user would see a conventional error message?


#### _References_
<a id="1">1. </a>[Heroku Dynos (official page)](https://www.heroku.com/dynos)

<a id="2">2. </a>["Heroku: Up and Running" by Middleton, Schneeman: ch. 7](https://www.oreilly.com/library/view/heroku-up-and/9781449341381/ch07.html)

<a id="3">3. </a>[Heroku Dev Centre: Session Affinity](https://devcenter.heroku.com/articles/session-affinity)
