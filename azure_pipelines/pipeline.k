"""
Azure Pipeline schema definition

See: https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pipeline
"""

schema Pipeline:
    """
    Azure Pipeline definition. A pipeline is one or more stages that describe a CI/CD process.

    Supports four implementations:
    - stages: Pipeline with explicit stages
    - extends: Pipeline extending a template
    - jobs: Pipeline with jobs and one implicit stage
    - steps: Pipeline with steps and one implicit job
    """

    name?: str
    pool?: str | any
    trigger?: str | [str] | any
    parameters?: [any]
    pr?: str | [str] | any
    schedules?: [any]
    resources?: Resources
    variables?: any | [any]
    lockBehavior?: "sequential" | "runLatest"
    appendCommitMessageToRunName?: bool

    stages?: [any]
    extends?: Extends
    jobs?: [any]
    steps?: [any]

    check:
        stages or extends or jobs or steps, "Pipeline must specify one of: stages, extends, jobs, or steps"
