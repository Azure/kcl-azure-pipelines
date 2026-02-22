import .build
import .container

schema Resources:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources
    """

    builds?: [build.Build]
    containers?: [container.Container]
    pipelines?: [any]
    repositories?: [any]
    webhooks?: [any]
    packages?: [any]
