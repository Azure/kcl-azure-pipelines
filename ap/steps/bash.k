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
    target?: str | any
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: str
    retryCountOnTaskFailure?: str
