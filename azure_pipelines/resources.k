import .include_exclude_filters

schema Resources:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources
    """

    builds?: [Build]
    containers?: [Container]
    pipelines?: [any]
    repositories?: [any]
    webhooks?: [any]
    packages?: [any]

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

schema Container:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-containers-container
    """

    container: str
    image: str
    type?: str
    trigger?: ContainerTrigger
    azureSubscription?: str
    resourceGroup?: str
    registry?: str
    repository?: str
    localImage?: bool
    endpoint?: str
    env?: {str: str}
    mapDockerSocket?: bool
    options?: str
    ports?: [str]
    volumes?: [str]
    mountReadOnly?: MountReadOnly

type ContainerTrigger = "none" | "true" | ContainerTriggerFull

schema ContainerTriggerFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-containers-container-trigger
    """

    enabled?: bool
    tags?: [str] | include_exclude_filters.IncludeExcludeFilters

schema MountReadOnly:
    work?: bool
    externals?: bool
    tools?: bool
    tasks?: bool
