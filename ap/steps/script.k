import ap.target

schema Script:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-script
    """

    script: str
    failOnStderr?: str
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
