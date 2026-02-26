import azure_pipelines.extends
import azure_pipelines.jobs.deployment.deployment
import azure_pipelines.jobs.job
import azure_pipelines.parameters as params
import azure_pipelines.resources.resources
import azure_pipelines.steps.steps


schema Pipeline:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pipeline
    """

    name?: str
    pool?: str | Pool
    trigger?: Trigger
    parameters?: [params.Parameter]
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
