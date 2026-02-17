import azure_pipelines.pipeline
import azure_pipelines.job
import azure_pipelines.stage
import azure_pipelines.steps.script
import azure_pipelines.steps.task

myPipeline: pipeline.Pipeline {
    name = "CI-Build"
    trigger = ["main", "develop"]

    stages = [
        stage.Stage {
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
