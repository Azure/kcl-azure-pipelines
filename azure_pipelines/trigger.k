import .include_exclude_filters

type Trigger = "none" | [str] | TriggerFull

schema TriggerFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/trigger
    """

    batch?: bool
    branches?: Branches
    paths?: include_exclude_filters.IncludeExcludeFilters
    tags?: include_exclude_filters.IncludeExcludeFilters

type Branches = [str] | include_exclude_filters.IncludeExcludeFilters

