schema Cron:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/schedules-cron
    """

    cron: str
    displayName?: str
    branches?: any
    batch?: bool
    always?: bool
