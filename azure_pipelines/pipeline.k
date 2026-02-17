import .job
import .stage
import .tpl
import .variable
import .schedules
import .steps
import .trigger

schema Pipeline:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pipeline
    """

    name?: str
    pool?: str | any
    trigger?: trigger.Trigger
    parameters?: [any]
    pr?: str | [str] | any
    schedules?: [schedules.Cron]
    resources?: any
    variables?: variable.Variables
    lockBehavior?: "sequential" | "runLatest"
    appendCommitMessageToRunName?: bool

    stages: [stage.Stage | tpl.Template]
    extends?: any
    jobs?: [job.Job | any]
    steps?: [steps.Step]

    check:
        stages or extends or jobs or steps, "Pipeline must specify one of: stages, extends, jobs, or steps"
