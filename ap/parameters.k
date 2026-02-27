schema Parameter:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/parameters-parameter
    """

    name: str
    displayName?: str
    type?: "string" | "number" | "boolean" | "object" | "step" | "stepList" | "job" | "jobList" | "deployment" | "deploymentList" | "stage" | "stageList"
    default?: any
    values?: [str]
