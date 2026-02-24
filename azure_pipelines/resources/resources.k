import .build
import .container
import .pipeline

schema Resources:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources
    """

    builds?: [build.Build]
    containers?: [container.Container]
    pipelines?: [pipeline.Pipeline]
    repositories?: [any]
    webhooks?: [any]
    packages?: [any]
