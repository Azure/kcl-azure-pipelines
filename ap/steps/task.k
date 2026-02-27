import ap.target

schema Task:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-task
    """

    task: str
    inputs?: {str: str}
    condition?: str
    continueOnError?: bool
    displayName?: str
    target?: target.Target
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: int
    retryCountOnTaskFailure?: int
