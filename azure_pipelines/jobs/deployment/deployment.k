import ...pool
import ...variable
import ..container
import ..uses
import ..workspace
import .environment
import .strategy

schema Deployment:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment
    """

    deployment: str
    displayName?: str
    dependsOn?: str | [str]
    condition?: str
    continueOnError?: str
    timeoutInMinutes?: str
    cancelTimeoutInMinutes?: str
    variables?: variable.Variables
    pool?: str | pool.Pool
    environment: str | environment.Environment
    strategy: strategy.Strategy
    workspace?: workspace.Workspace
    uses?: uses.Uses
    container?: str | container.Container
    services?: {str: str}
    templateContext?: {str: any}
