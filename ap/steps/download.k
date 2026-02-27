schema Download:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-download
    """

    download: str
    artifact?: str
    patterns?: str
    condition?: str
    continueOnError?: bool
    displayName?: str
    target?: str | any
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: str
    retryCountOnTaskFailure?: str
