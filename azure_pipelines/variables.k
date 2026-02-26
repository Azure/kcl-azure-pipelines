import .tpl

type Variables = {str: str} | [Name | Group | tpl.Template]

schema Name:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/variables-name
    """

    name: str
    value?: str
    readonly?: bool


schema Group:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/variables-group
    """

    group: str
