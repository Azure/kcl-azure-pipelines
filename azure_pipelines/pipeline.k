import .job
import .stage
import .tpl
import .variable

schema Pipeline:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pipeline
    """

    name?: str
    pool?: str | any
    trigger?: str | [str] | any
    parameters?: [any]
    pr?: str | [str] | any
    schedules?: [any]
    resources?: any
    variables?: variable.Variables
    lockBehavior?: "sequential" | "runLatest"
    appendCommitMessageToRunName?: bool

    stages: [stage.Stage | tpl.Template]
    extends?: any
    jobs?: [job.Job | any]
    steps?: [any]

    check:
        stages or extends or jobs or steps, "Pipeline must specify one of: stages, extends, jobs, or steps"
