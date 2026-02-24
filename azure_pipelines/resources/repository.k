import ..trigger

schema Repository:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-repositories-repository
    """

    repository: str
    endpoint?: str
    trigger?: trigger.Trigger
    name?: str
    ref?: str
    type?: "git" | "github" | "githubenterprise" | "bitbucket"
