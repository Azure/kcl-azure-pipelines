import azure_pipelines.pool
import azure_pipelines.variables
import azure_pipelines.jobs.job.container
import azure_pipelines.jobs.job.uses
import azure_pipelines.jobs.workspace
import azure_pipelines.jobs.deployment.environment
import azure_pipelines.jobs.deployment.strategy

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
    variables?: variables.Variables
    pool?: str | pool.Pool
    environment: str | environment.Environment
    strategy: strategy.Strategy
    workspace?: workspace.Workspace
    uses?: uses.Uses
    container?: str | container.Container
    services?: {str: str}
    templateContext?: {str: any}
