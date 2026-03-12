import ap.target

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
    target?: target.Target
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: int
    retryCountOnTaskFailure?: str
