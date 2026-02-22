import .job
import .parameters
import .pr
import .resources
import .schedules
import .stage
import .steps
import .tpl
import .trigger
import .variable

schema Pipeline:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pipeline
    """

    name?: str
    pool?: str | any
    trigger?: trigger.Trigger
    parameters?: [parameters.Parameter]
    pr?: pr.PR
    schedules?: [schedules.Cron]
    resources?: resources.Resources
    variables?: variable.Variables
    lockBehavior?: "sequential" | "runLatest"
    appendCommitMessageToRunName?: bool

    stages: [stage.Stage | tpl.Template]
    extends?: any
    jobs?: [job.Job | any]
    steps?: [steps.Step]

    check:
        stages or extends or jobs or steps, "Pipeline must specify one of: stages, extends, jobs, or steps"
