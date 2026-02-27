# KCL Azure Pipelines - Coding Style Guide

This document describes the coding conventions and patterns used in this repository for implementing Azure Pipelines schemas in KCL.

## Import Conventions

### 1. Use Absolute Imports
Always use absolute imports starting with `ap.`:

```kcl
import ap.steps
import ap.pool
import ap.jobs.deployment
```

**Don't** use relative imports:
```kcl
import .steps          # Bad
import ..pool          # Bad
```

### 2. Import Modules, Not Individual Types
Import the module and use qualified references:

```kcl
import ap.steps

schema Hook:
    steps?: [steps.Step]  # Use module.Type
    pool?: pool.Pool
```

### 3. Package-Level Type Availability
Types defined in a package are available to sibling files without explicit imports:

```kcl
# In ap/jobs/deployment/strategy.k
# Hook and OnSuccessOrFailureHook from hooks.k are available
schema RunOnceDetails:
    preDeploy?: Hook                    # No import needed
    on?: OnSuccessOrFailureHook         # No import needed
```

## Schema Conventions

### 1. Documentation
Every schema must include a docstring with Azure DevOps documentation link. Do not include description of the schema's purpose, unless it's really necessary.

```kcl
schema Pipeline:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pipeline
    """

    name?: str
    # ... fields
```

For file-level documentation (especially for types):
```kcl
"""
https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps
"""
type Step = Task | Script | Bash | ...
```

### 2. Type Unions
Use type unions for flexible schemas that accept multiple forms:

```kcl
type Pool = str | PoolFull
type Trigger = "none" | [str] | TriggerFull
type Variables = {str: str} | [Name | Group | tpl.Template]
```

Pattern: `type Name = SimpleForm | ComplexForm | ...`

### 3. Schema Naming
- Use CamelCase for schema names: `Pipeline`, `PoolFull`, `TriggerFull`

### 4. Field Conventions
- Use `?` for optional fields (most fields are optional in Azure Pipelines)
- Use camelCase for field names to match Azure Pipelines YAML syntax

```kcl
schema Task:
    task: str              # Required
    inputs?: {str: str}    # Optional
    displayName?: str      # Optional
```

### 5. Consolidate Duplicate Schemas
If multiple schemas share the same structure, consolidate them into a single reusable schema:

```kcl
# Good: Single reusable schema
schema Hook:
    steps?: [steps.Step]
    pool?: pool.Pool

# Used by multiple lifecycle hooks
schema RunOnceDetails:
    preDeploy?: Hook
    deploy?: Hook
    routeTraffic?: Hook
```

**Don't** create separate schemas for identical structures:
```kcl
# Bad: Duplicate schemas
schema PreDeployHook:
    steps?: [steps.Step]
    pool?: pool.Pool

schema DeployHook:
    steps?: [steps.Step]
    pool?: pool.Pool
```

## Type Patterns

### 1. String Enumerations
Use string literals for enums:

```kcl
schema TargetFull:
    commands?: "any" | "restricted"
```

## File Organization

### 1. Import Order
1. External/package imports
2. Blank line
3. Module documentation (if applicable)
4. Type definitions
5. Schema definitions

```kcl
import ap.steps
import ap.pool

"""
Module documentation
"""

type Strategy = RunOnce | Rolling | Canary

schema RunOnce:
    # ...
```

### 2. One Concept Per File
Each file should focus on a single concept:
- `pool.k` - Pool configurations
- `trigger.k` - Trigger configurations
- `steps.k` - Step type union
- Individual step files: `task.k`, `script.k`, `bash.k`, etc.

### 3. Nested Schemas
For complex schemas with nested components, create subdirectories:
- `ap/jobs/job/` - Job-related schemas
- `ap/jobs/deployment/` - Deployment-related schemas
- `ap/steps/` - Step type implementations
- `ap/resources/` - Resource type implementations

## Validation and Constraints

### 1. Schema Checks
Use `check` blocks for validation rules:

```kcl
schema Pipeline:
    stages?: [Stage]
    jobs?: [Job]
    steps?: [Step]
    extends?: Extends

    check:
        stages or extends or jobs or steps, "Pipeline must specify one of: stages, extends, jobs, or steps"
```

### 2. Type Safety
Prefer strongly-typed unions over `any`:

```kcl
# ✅ Good: Type-safe union
type Pool = str | PoolFull

# ❌ Bad: Using any
pool?: any
```

## Examples and Testing

### 1. Provide Examples
Include an `example.k` file demonstrating usage:

```kcl
import ap

myPipeline: ap.Pipeline {
    name = "CI-Build"
    trigger = ap.TriggerFull {
        branches = {
            include = ["main"]
        }
    }
    stages = [
        ap.Stage {
            stage = "Build"
            jobs = [
                # ...
            ]
        }
    ]
}
```

### 2. Validation
Test that examples validate correctly:

```bash
kcl run example.k -S myPipeline
```

## Azure Pipelines Mapping

### 1. Mirror YAML Structure
KCL schemas should mirror the YAML structure from Azure Pipelines:

```yaml
# Azure Pipelines YAML
trigger:
  branches:
    include:
      - main
```

```kcl
# KCL Schema
schema TriggerFull:
    branches?: Branches

type Branches = [str] | IncludeExcludeFilters

schema IncludeExcludeFilters:
    include?: [str]
    exclude?: [str]
```

### 2. Maintain Azure Documentation Links
Always include links to official Azure DevOps documentation:

```kcl
schema Task:
    """
    https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps-task
    """
```

## Summary

**Key Principles:**
1. ✅ Use absolute imports (`ap.module`)
1. ✅ Import modules, not individual types
1. ✅ Document with Azure DevOps links
1. ✅ Use type unions for flexibility
1. ✅ Consolidate duplicate schemas
1. ✅ Mirror Azure Pipelines YAML structure
1. ✅ Provide type safety over `any`
1. ✅ One concept per file
1. ✅ Include validation examples
