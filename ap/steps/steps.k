import ap.tpl

"""
https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps
"""
type Step = Task | Script | Powershell | Pwsh | Bash | Checkout | Download | DownloadBuild | GetPackage | Publish | tpl.Template | ReviewApp
