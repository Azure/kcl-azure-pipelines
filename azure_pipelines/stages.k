import .jobs.job

schema Stage:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/stages-stage
    """

    stage: str
    displayName?: str
    pool?: str | Pool
    dependsOn?: str | [str]
    condition?: str
    variables?: Variables
    jobs?: [job.Job | Template]
    lockBehavior?: "sequential" | "runLatest"
    trigger?: "manual" | "automatic"
    isSkippable?: bool
