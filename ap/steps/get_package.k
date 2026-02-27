import ap.target

schema GetPackage:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-get-package
    """

    getPackage: str
    path?: str
    condition?: str
    continueOnError?: bool
    displayName?: str
    target?: target.Target
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: str
    retryCountOnTaskFailure?: str
