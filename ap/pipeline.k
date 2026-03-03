import ap.jobs.deployment
import ap.jobs.job
import ap.resources
import ap.steps


schema Pipeline:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pipeline
    """

    name?: str
    pool?: str | Pool
    trigger?: Trigger
    parameters?: [Parameter]
    pr?: PR
    schedules?: [Cron]
    resources?: resources.Resources
    variables?: Variables
    lockBehavior?: "sequential" | "runLatest"
    appendCommitMessageToRunName?: bool

    stages?: [Stage | Template]
    extends?: Extends
    jobs?: [job.Job | deployment.Deployment | Template]
    steps?: [steps.Step]

    check:
        stages or extends or jobs or steps, "Pipeline must specify one of: stages, extends, jobs, or steps"
