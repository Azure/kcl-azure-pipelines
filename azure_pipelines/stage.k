schema Stage:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/stages-stage
    """
    
    stage: str
    displayName?: str
    pool?: str | any
    dependsOn?: str | [str]
    condition?: str
    variables?: any | [any]
    jobs?: [any]
    lockBehavior?: "sequential" | "runLatest"
    trigger?: "manual" | "automatic"
    isSkippable?: bool

schema StagesTemplate:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/stages-template
    """

    template: str
    parameters?: {str: any}
