# setup winget
$URL = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
$URL = (Invoke-WebRequest -Uri $URL).Content | ConvertFrom-Json |
        Select-Object -ExpandProperty "assets" |
        Where-Object "browser_download_url" -Match '.msixbundle' |
        Select-Object -ExpandProperty "browser_download_url"

Invoke-WebRequest -Uri $URL -OutFile "Setup.msix" -UseBasicParsing
Add-AppxPackage -Path "Setup.msix"
Remove-Item "Setup.msix"

# install programs
winget install Git.Git
winget install Python.Python.3.11
winget install Docker.DockerDesktop
winget install OpenJS.NodeJS
winget install JetBrains.DataGrip
winget install JetBrains.WebStorm
winget install Microsoft.VisualStudio.2022.Community.Preview
winget install Atlassian.Sourcetree
winget install Posit.RStudio
