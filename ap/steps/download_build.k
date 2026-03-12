import ap.target

schema DownloadBuild:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-download-build
    """

    downloadBuild: str
    artifact?: str
    path?: str
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
