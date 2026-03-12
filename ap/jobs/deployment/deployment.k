import ap.pool
import ap.variables
import ap.jobs.job
import ap.jobs.workspace

schema Deployment:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment
    """

    deployment: str
    displayName?: str
    dependsOn?: str | [str]
    condition?: str
    continueOnError?: str
    timeoutInMinutes?: int
    cancelTimeoutInMinutes?: int
    variables?: variables.Variables
    pool?: str | pool.Pool
    environment: str | Environment
    strategy: Strategy
    workspace?: workspace.Workspace
    uses?: job.Uses
    container?: str | job.Container
    services?: {str: str}
    templateContext?: {str: any}
