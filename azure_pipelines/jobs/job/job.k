import ...pool
import ...steps.steps
import ...variable
import ..workspace
import .container
import .strategy
import .uses

schema Job:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-job
    """

    job: str
    displayName?: str
    dependsOn?: str | [str]
    condition?: str
    continueOnError?: str
    timeoutInMinutes?: str
    cancelTimeoutInMinutes?: str
    variables?: variable.Variables
    strategy?: strategy.Strategy
    pool?: str | pool.Pool
    container?: str | container.Container
    services?: {str: str}
    workspace?: workspace.Workspace
    uses?: uses.Uses
    steps?: [steps.Step]
