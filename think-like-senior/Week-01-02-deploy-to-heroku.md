# Start thinking like a senior

## Heroku

### Dyno
The sandboxed environment (_container_) on Heroku, which hosts the app code and dependencies, with its own resources of computation power, memory, OS and an ephemeral file system [[1]](#1). On Heroku, these _containers_ are virtual Linux environments.

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
- Build issues due to `.slugignore`: Check that Heroku's equivalent of Git's `.gitignore`, where Heroku ignores the mentioned files and directories, does not contain the required files/directories [[2]](#2)
- Is there an issue with the upstream provider or host? What does https://status.heroku.com say? IF so then one has little choice but to wait.
- Does reversion to the previous deployment resolve the issue? If there is a test/staging/development server of the same infrastructure then is that online and functional? Can the test environment and production be brought to parity to help diagnose the issue?

#### Buildpacks: 
  Buildpack: component of Heroku which sets up the environment for the application: dependencies, assets etc.


#### _References_
<a id="1">1. </a>[Heroku Dynos (official page)](https://www.heroku.com/dynos)

<a id="2">2. </a>["Heroku: Up and "Running by Middleton, Schneeman: ch. 7](https://www.oreilly.com/library/view/heroku-up-and/9781449341381/ch07.html)
