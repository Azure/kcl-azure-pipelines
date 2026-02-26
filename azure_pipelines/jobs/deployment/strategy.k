type Strategy = RunOnce | Rolling | Canary

schema RunOnce:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment-strategy
    """

    runOnce: any

schema Rolling:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment-strategy
    """

    rolling: any

schema Canary:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment-strategy
    """

    canary: any
