"""
https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/target
"""

type Target = str | TargetFull

schema TargetFull:
    """
    Configure step target with container, commands, and settable variables
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/target
    """

    container?: str
    commands?: "any" | "restricted"
    settableVariables?: "none" | [str]
