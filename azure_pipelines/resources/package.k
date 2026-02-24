schema Package:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-packages-package
    """

    package: str
    type: str
    connection: str
    name: str
    version?: str
    tag?: str
    trigger?: "none" | "true"
