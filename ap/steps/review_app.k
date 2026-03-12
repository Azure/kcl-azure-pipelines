import ap.target

schema ReviewApp:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-review-app
    """

    reviewApp: str
    condition?: str
    continueOnError?: bool
    displayName?: str
    target?: target.Target
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: int
    retryCountOnTaskFailure?: str
