import azure_pipelines as ap
import azure_pipelines.include_exclude_filters
import azure_pipelines.jobs.job
import azure_pipelines.steps

myPipeline: ap.Pipeline {
    name = "CI-Build"
    trigger = ap.TriggerFull {
        branches = include_exclude_filters.IncludeExcludeFilters {
            include = ["main", "develop", "features/*"]
            exclude = ["features/experimental/*"]
        }
    }
    schedules = [
        ap.Cron {
            cron = "0 0 * * 0"
            displayName = "Weekly Sunday build"
            branches = ["main"]
            always = True
        }
    ]
    variables = [
        ap.Name {
            name = "buildConfiguration"
            value = "Release"
            readonly = True
        }
        ap.Group {
            group = "production-secrets"
        }
    ]
    stages = [
        ap.Stage {
            stage = "Build"
            displayName = "Build Stage"

            jobs = [
                job.Job {
                    job = "BuildJob"
                    displayName = "Build and Test"
                    pool = "ubuntu-latest"

                    steps = [
                        steps.Script {
                            script = "echo 'Starting build process...'"
                            displayName = "Print start message"
                        }

                        steps.Task {
                            task = "NodeTool@0"
                            displayName = "Install Node.js"
                            inputs = {
                                versionSpec = "18.x"
                            }
                        }

                        steps.Script {
                            script = "npm install"
                            displayName = "Install dependencies"
                            workingDirectory = "$(Build.SourcesDirectory)"
                        }

                        steps.Script {
                            script = "npm run build"
                            displayName = "Build application"
                        }

                        steps.Task {
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
