schema Task:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-task
    """

    task: str
    inputs?: {str: str}
    condition?: str
    continueOnError?: bool
    displayName?: str
    target?: str | any
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: int
    retryCountOnTaskFailure?: int
