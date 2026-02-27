schema Environment:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment-environment
    """

    name: str
    resourceName?: str
    resourceId?: str
    resourceType?: str
    tags?: str
