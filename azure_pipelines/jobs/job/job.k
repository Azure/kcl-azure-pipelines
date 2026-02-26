import azure_pipelines.pool
import azure_pipelines.steps.steps
import azure_pipelines.variables
import azure_pipelines.jobs.workspace
import azure_pipelines.jobs.job.container
import azure_pipelines.jobs.job.strategy
import azure_pipelines.jobs.job.uses

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
    variables?: variables.Variables
    strategy?: strategy.Strategy
    pool?: str | pool.Pool
    container?: str | container.Container
    services?: {str: str}
    workspace?: workspace.Workspace
    uses?: uses.Uses
    steps?: [steps.Step]
