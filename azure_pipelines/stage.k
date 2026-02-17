import .job
import .tpl
import .variable

schema Stage:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/stages-stage
    """

    stage: str
    displayName?: str
    pool?: str | any
    dependsOn?: str | [str]
    condition?: str
    variables?: variable.Variables
    jobs?: [job.Job | tpl.Template]
    lockBehavior?: "sequential" | "runLatest"
    trigger?: "manual" | "automatic"
    isSkippable?: bool
