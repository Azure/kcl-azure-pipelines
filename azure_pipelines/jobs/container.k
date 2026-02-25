import .workspace

schema Container:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-job-container
    """

    image: str
    endpoint?: str
    env?: {str: str}
    mapDockerSocket?: bool
    options?: str
    ports?: [str]
    volumes?: [str]
    mountReadOnly?: any
