$maxRetries = 3
$retryInterval = 10

$windowsPackageCollection = @(
  [PSCustomObject]@{
    PackageTitle = "Terminal - Easy to connect multiple kernels";
    PackageId    = "Microsoft.WindowsTerminal";
  },
  [PSCustomObject]@{
    PackageTitle = "BandiZip - Easy archiver";
    PackageId    = "Bandisoft.Bandizip";
  },
  [PSCustomObject]@{
    PackageTitle = "Draw.io Diagrams - Easy drawing diagrams";
    PackageId    = "JGraph.Draw";
  },
  [PSCustomObject]@{
    PackageTitle = "Sublime Text Editor - The sophisticated text editor for code, markup and prose";
    PackageId    = "SublimeHQ.SublimeText.4";
  },
  [PSCustomObject]@{
    PackageTitle = "PowerToys - Easy for Windows Experience";
    PackageId    = "Microsoft.PowerToys";
  }
)

Write-Host " "
Write-Host "❯ Upgrade all package via WinGet"
winget upgrade --all --include-unknown
Write-Host " "

$windowsPackageCollection | ForEach-Object {
  $windowsPackage = $_
  $operationSuccessful = $false
  $tryCount = 1

  while (-not $operationSuccessful) {
    Write-Host " "
    Write-Host "❯ Install $($windowsPackage.PackageTitle) [count: $tryCount]"
    Write-Host "❯ PS > winget install -e --id $($windowsPackage.PackageId)"
    winget install -e --id $($windowsPackage.PackageId) --accept-source-agreements
    if (($LASTEXITCODE -eq 0) -or ($LASTEXITCODE -eq -1978335189)) {
      $operationSuccessful = $true
      continue
    }

    Write-Host " "
    $tryCount++
    if ($tryCount -lt $maxRetries) {
      Write-Warning "❯ Retry after $retryInterval seconds..."
      Start-Sleep -Seconds $retryInterval
      continue
    }

    Write-Host " "
    Write-Error "❯ Maximum retries reached ($tryCount count). Retry later with this command:"
    Write-Host " "
    Write-Error "      PS > winget install -e --id $($windowsPackage.PackageId)"
    $operationSuccessful = $true # Exit the loop after max retries
  }
}
Write-Host " "
