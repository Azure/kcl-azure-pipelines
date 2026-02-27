type Strategy = RunOnce | Rolling | Canary

schema RunOnce:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment-strategy-run-once
    """

    runOnce: RunOnceDetails

schema RunOnceDetails:
    preDeploy?: Hook
    deploy?: Hook
    routeTraffic?: Hook
    postRouteTraffic?: Hook
    on?: OnSuccessOrFailureHook

schema Rolling:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment-strategy-rolling
    """

    rolling: RollingDetails

schema RollingDetails:
    maxParallel?: str
    preDeploy?: Hook
    deploy?: Hook
    routeTraffic?: Hook
    postRouteTraffic?: Hook
    on?: OnSuccessOrFailureHook

schema Canary:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment-strategy-canary
    """

    canary: CanaryDetails

schema CanaryDetails:
    increments?: [str]
    preDeploy?: Hook
    deploy?: Hook
    routeTraffic?: Hook
    postRouteTraffic?: Hook
    on?: OnSuccessOrFailureHook
