import .build
import .container
import .pipeline
import .repository

schema Resources:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources
    """

    builds?: [build.Build]
    containers?: [container.Container]
    pipelines?: [pipeline.Pipeline]
    repositories?: [repository.Repository]
    webhooks?: [any]
    packages?: [any]
