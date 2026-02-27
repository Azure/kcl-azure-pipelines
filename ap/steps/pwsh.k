import ap.target

schema Pwsh:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-pwsh
    """

    pwsh: str
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
    timeoutInMinutes?: str
    retryCountOnTaskFailure?: str
