import azure_pipelines.include_exclude_filters
import azure_pipelines.jobs.job.job
import azure_pipelines.pipeline
import azure_pipelines.schedules
import azure_pipelines.stages
import azure_pipelines.steps.script
import azure_pipelines.steps.task
import azure_pipelines.trigger
import azure_pipelines.variable

myPipeline: pipeline.Pipeline {
    name = "CI-Build"
    trigger = trigger.TriggerFull {
        branches = include_exclude_filters.IncludeExcludeFilters {
            include = ["main", "develop", "features/*"]
            exclude = ["features/experimental/*"]
        }
    }
    schedules = [
        schedules.Cron {
            cron = "0 0 * * 0"
            displayName = "Weekly Sunday build"
            branches = ["main"]
            always = True
        }
    ]
    variables = [
        variable.Name {
            name = "buildConfiguration"
            value = "Release"
            readonly = True
        }
        variable.Group {
            group = "production-secrets"
        }
    ]
    stages = [
        stages.Stage {
            stage = "Build"
            displayName = "Build Stage"

            jobs = [
                job.Job {
                    job = "BuildJob"
                    displayName = "Build and Test"
                    pool = "ubuntu-latest"

                    steps = [
                        script.Script {
                            script = "echo 'Starting build process...'"
                            displayName = "Print start message"
                        }

                        task.Task {
                            task = "NodeTool@0"
                            displayName = "Install Node.js"
                            inputs = {
                                versionSpec = "18.x"
                            }
                        }

                        script.Script {
                            script = "npm install"
                            displayName = "Install dependencies"
                            workingDirectory = "$(Build.SourcesDirectory)"
                        }

                        script.Script {
                            script = "npm run build"
                            displayName = "Build application"
                        }

                        task.Task {
                            task = "PublishTestResults@2"
                            displayName = "Publish test results"
                            inputs = {
                                testResultsFormat = "JUnit"
                                testResultsFiles = "**/test-results.xml"
                            }
                            condition = "succeededOrFailed()"
                        }
                    ]
                }
            ]
        }
    ]
}
