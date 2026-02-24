import ..include_exclude_filters

schema Pipeline:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-pipelines-pipeline
    """

    pipeline: str
    project?: str
    source?: str
    version?: str
    branch?: str
    tags?: [str]
    trigger?: Trigger

type Trigger = "none" | "true" | TriggerFull

schema TriggerFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/resources-pipelines-pipeline-trigger
    """

    enabled?: bool
    branches?: [str] | include_exclude_filters.IncludeExcludeFilters
    stages?: [str]
    tags?: [str]
