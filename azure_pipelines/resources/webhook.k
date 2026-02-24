schema Webhook:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-webhooks-webhook
    """

    webhook: str
    connection: str
    type?: str
    filters?: [Filter]

schema Filter:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-webhooks-webhook-filters-filter
    """

    path: str
    value: str
