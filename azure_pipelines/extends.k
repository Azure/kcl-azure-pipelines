import azure_pipelines.parameters

schema Extends:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/extends
    """

    template: str
    parameters?: [parameters.Parameter]
