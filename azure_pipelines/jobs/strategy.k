type Strategy = StrategyMatrix | StrategyParallel

schema StrategyMatrix:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-job-strategy
    """

    matrix: {str: {str: str}}
    maxParallel?: int

schema StrategyParallel:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-job-strategy
    """

    parallel: int
