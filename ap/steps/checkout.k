import ap.target

schema Checkout:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-checkout
    """

    checkout: str
    clean?: bool
    fetchDepth?: str
    fetchFilter?: str
    fetchTags?: str
    lfs?: str
    persistCredentials?: str
    submodules?: str
    path?: str
    sparseCheckoutDirectories?: str
    sparseCheckoutPatterns?: str
    workspaceRepo?: bool
    condition?: str
    continueOnError?: bool
    displayName?: str
    target?: target.Target
    enabled?: bool
    env?: {str: str}
    name?: str
    timeoutInMinutes?: int
    retryCountOnTaskFailure?: str
