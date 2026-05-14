schema Template:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/stages-template
    """

    template: str
    parameters?: {str: any}

    # _content is the used to produce Template yaml. It is not exported.
    _content: any
