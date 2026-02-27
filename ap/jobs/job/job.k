import ap.pool
import ap.steps
import ap.variables
import ap.jobs.workspace

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
    strategy?: Strategy
    pool?: str | pool.Pool
    container?: str | Container
    services?: {str: str}
    workspace?: workspace.Workspace
    uses?: Uses
    steps?: [steps.Step]
