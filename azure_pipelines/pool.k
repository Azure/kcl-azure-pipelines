type Pool = str | PoolFull

schema PoolFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pool
    """

    name?: str
    demands?: str | [str]
    vmImage?: str
