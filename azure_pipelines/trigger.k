type Trigger = "none" | "true" | TriggerFull

schema TriggerFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/trigger
    """

    enabled?: bool
    branches?: Branches
    stages?: [str]
    tags?: [str]

"""
https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/include-exclude-filters
"""

type Branches = [str] | IncludeExclude

schema IncludeExclude:
    include?: [str]
    exclude?: [str]

