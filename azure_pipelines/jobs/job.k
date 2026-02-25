import .container
import .strategy
import .workspace

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
    variables?: any
    strategy?: strategy.Strategy
    pool?: any
    container?: str | container.Container
    services?: {str: str}
    workspace?: workspace.Workspace
    uses?: any
    steps?: [any]
