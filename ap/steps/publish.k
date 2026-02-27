import ap.target

schema Publish:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-publish
    """

    publish: str
    artifact?: str
    condition?: str
    continueOnError?: bool
    displayName?: str
    target?: target.Target
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: str
    retryCountOnTaskFailure?: str
