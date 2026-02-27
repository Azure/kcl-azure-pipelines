import ap.extends
import ap.jobs.deployment.deployment
import ap.jobs.job
import ap.parameters
import ap.resources.resources
import ap.steps.steps


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
    variables?: Variables
    lockBehavior?: "sequential" | "runLatest"
    appendCommitMessageToRunName?: bool

    stages: [Stage | Template]
    extends?: extends.Extends
    jobs?: [job.Job | deployment.Deployment | Template]
    steps?: [steps.Step]

    check:
        stages or extends or jobs or steps, "Pipeline must specify one of: stages, extends, jobs, or steps"
