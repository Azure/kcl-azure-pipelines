import ap.target

schema Powershell:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-powershell
    """

    powershell: str
    errorActionPreference?: str
    failOnStderr?: str
    ignoreLASTEXITCODE?: str
    workingDirectory?: str
    condition?: str
    continueOnError?: bool
    displayName?: str
    target?: target.Target
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: int
    retryCountOnTaskFailure?: str
