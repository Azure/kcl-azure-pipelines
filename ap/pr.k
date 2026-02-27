import ap.include_exclude_filters

type PR = "none" | [str] | PRFull

schema PRFull:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pr
    """

    autoCancel?: bool
    branches?: include_exclude_filters.IncludeExcludeFilters
    paths?: include_exclude_filters.IncludeExcludeFilters
    drafts?: bool
