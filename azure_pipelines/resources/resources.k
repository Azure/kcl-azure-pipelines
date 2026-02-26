import azure_pipelines.resources.build
import azure_pipelines.resources.container
import azure_pipelines.resources.package
import azure_pipelines.resources.pipeline
import azure_pipelines.resources.repository
import azure_pipelines.resources.webhook

schema Resources:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources
    """

    builds?: [build.Build]
    containers?: [container.Container]
    pipelines?: [pipeline.Pipeline]
    repositories?: [repository.Repository]
    webhooks?: [webhook.Webhook]
    packages?: [package.Package]
