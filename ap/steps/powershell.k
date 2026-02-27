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
    target?: str | any
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: str
    retryCountOnTaskFailure?: str
