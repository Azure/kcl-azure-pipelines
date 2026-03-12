import ap.target

schema Bash:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-bash
    """

    bash: str
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
