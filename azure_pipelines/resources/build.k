schema Build:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-builds-build
    """

    build: str
    type: str
    connection: str
    source: str
    version?: str
    branch?: str
    trigger?: "none" | "true"
