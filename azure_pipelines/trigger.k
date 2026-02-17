type Trigger = "none" | [str] | TriggerFull

schema TriggerFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/trigger
    """

    batch?: bool
    branches?: Branches
    paths?: IncludeExclude
    tags?: IncludeExclude

type Branches = [str] | IncludeExclude

schema IncludeExclude:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/include-exclude-filters
    """

    include?: [str]
    exclude?: [str]

