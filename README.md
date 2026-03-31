# KCL Azure Pipelines

Type-safe Azure Pipelines YAML configuration using [KCL](https://www.kcl-lang.io/).

## Overview

This library provides KCL schemas for Azure Pipelines, enabling you to write type-safe pipeline configurations with IDE support, validation, and better maintainability compared to raw YAML.

## Installation

Add this package to your KCL project:

```bash
kcl mod add git://github.com/Azure/kcl-azure-pipelines --tag 1.0.0
```

Or add it to your `kcl.mod` file:

```toml
[dependencies]
azure_pipelines = { git = "https://github.com/Azure/kcl-azure-pipelines", tag = "1.0.0", version = "1.0.0" }
```

## Usage

Import the library and use the schemas to define your pipeline:

```kcl
import azure_pipelines.ap

# Define your pipeline
my_pipeline: ap.Pipeline {
    name = "CI-Build"

    trigger = ap.TriggerFull {
        branches = {
            include = ["main", "develop"]
        }
    }

    variables = [
        ap.Name {
            name = "buildConfiguration"
            value = "Release"
        }
    ]

    stages = [
        ap.Stage {
            stage = "Build"
            displayName = "Build Stage"

            jobs = [
                {
                    job = "BuildJob"
                    pool = "ubuntu-latest"

                    steps = [
                        {script = "npm install"}
                        {script = "npm run build"}
                    ]
                }
            ]
        }
    ]
}
```

Generate the Azure Pipelines YAML:

```bash
kcl run my_pipeline.k -S my_pipeline -o my_pipeline.yaml
```

## Documentation

- [Azure Pipelines YAML Schema](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/) - Official Azure documentation
