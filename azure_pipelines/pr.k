type PR = "none" | [str] | PRFull

schema PRFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pr
    """

    autoCancel?: bool
    branches?: IncludeExcludeFilters
    paths?: IncludeExcludeFilters
    drafts?: bool
