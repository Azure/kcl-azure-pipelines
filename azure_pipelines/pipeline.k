import .extends
import .jobs.deployment.deployment
import .jobs.job
import .parameters
import .resources.resources
import .steps.steps
import .variable

schema Pipeline:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pipeline
    """

    name?: str
    pool?: str | Pool
    trigger?: Trigger
    parameters?: [parameters.Parameter]
    pr?: PR
    schedules?: [Cron]
    resources?: resources.Resources
    variables?: variable.Variables
    lockBehavior?: "sequential" | "runLatest"
    appendCommitMessageToRunName?: bool

    stages: [Stage | Template]
    extends?: extends.Extends
    jobs?: [job.Job | deployment.Deployment | Template]
    steps?: [steps.Step]

    check:
        stages or extends or jobs or steps, "Pipeline must specify one of: stages, extends, jobs, or steps"
