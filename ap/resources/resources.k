import ap.resources.build
import ap.resources.container
import ap.resources.package
import ap.resources.pipeline
import ap.resources.repository
import ap.resources.webhook

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
