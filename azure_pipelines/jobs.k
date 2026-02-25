import .mount_read_only
import .pool
import .steps
import .strategy
import .variable

schema Container:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-job-container
    """

    image: str
    endpoint?: str
    env?: {str: str}
    mapDockerSocket?: bool
    options?: str
    ports?: [str]
    volumes?: [str]
    mountReadOnly?: mount_read_only.MountReadOnly

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
    container?: str | Container
    services?: {str: str}
    workspace?: any
    uses?: any
    steps?: [steps.Step]
