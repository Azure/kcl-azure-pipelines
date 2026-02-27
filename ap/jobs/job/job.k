import ap.pool
import ap.steps.steps
import ap.variables
import ap.jobs.workspace
import ap.jobs.job.container
import ap.jobs.job.strategy
import ap.jobs.job.uses

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
