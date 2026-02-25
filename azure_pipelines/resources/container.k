import ..include_exclude_filters
import ..mount_read_only

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
    mountReadOnly?: mount_read_only.MountReadOnly

type ContainerTrigger = "none" | "true" | ContainerTriggerFull

schema ContainerTriggerFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-containers-container-trigger
    """

    enabled?: bool
    tags?: [str] | include_exclude_filters.IncludeExcludeFilters
