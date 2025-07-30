$windowsFeatureCollection = @(
  [PSCustomObject]@{
    GuideMessage = "Hyper-V on Windows";
    FeatureName  = "Microsoft-Hyper-V";
  },
  [PSCustomObject]@{
    GuideMessage = "Windows Subsystem for Linux";
    FeatureName  = "Microsoft-Windows-Subsystem-Linux";
  },
  [PSCustomObject]@{
    GuideMessage = "Virtual Machine Platform";
    FeatureName  = "VirtualMachinePlatform";
  }
)

$windowsFeatureCollection | ForEach-Object {
  Write-Host " "
  Write-Host "❯ To enable $($_.GuideMessage):"
  Enable-WindowsOptionalFeature -Online -FeatureName $($_.FeatureName) -All -NoRestart
}

Write-Host " "
Write-Host "❯ To enable the Hyper-V role on Windows using DISM (Deployment Image Service and Management)"
DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V
Write-Host " "
