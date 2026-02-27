import ap.trigger

schema Cron:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/schedules-cron
    """

    cron: str
    displayName?: str
    branches?: trigger.Branches
    batch?: bool
    always?: bool
