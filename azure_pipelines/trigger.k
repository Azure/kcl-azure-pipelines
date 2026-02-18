import .include_exclude_filters

type Trigger = "none" | "true" | TriggerFull

schema TriggerFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/trigger
    """

    enabled?: bool
    branches?: Branches
    stages?: [str]
    tags?: [str]

type Branches = [str] | include_exclude_filters.IncludeExcludeFilters

