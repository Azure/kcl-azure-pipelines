import .pool
import .steps
import .strategy
import .variable

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
    container?: str | any
    services?: {str: str}
    workspace?: any
    uses?: any
    steps?: [steps.Step]
