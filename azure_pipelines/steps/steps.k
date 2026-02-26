import azure_pipelines.steps.script
import azure_pipelines.steps.task

type Step = script.Script | task.Task | any
