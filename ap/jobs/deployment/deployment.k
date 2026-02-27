import ap.pool
import ap.variables
import ap.jobs.job.container
import ap.jobs.job.uses
import ap.jobs.workspace
import ap.jobs.deployment.environment
import ap.jobs.deployment.strategy

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
