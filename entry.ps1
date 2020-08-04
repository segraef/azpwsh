Param( 
  [string]$inlineScript,
  [string]$script,
  [string]$azPSVersion = 'latest'
)

Write-Host "InvocationName:" $MyInvocation.InvocationName
Write-Host "Path:" $MyInvocation.MyCommand.Path
Write-Host "Script:" $PSCommandPath
Write-Host "Path:" $PSScriptRoot

$context = Get-AzContext
if (!$context) {
  Write-Output "##########`nNo Azure context found! Please make sure azlogin has run before.`n##########"
  exit
}

Try {
  if ($inlineScript) {
    Write-Output "##########`ninlineScript`n"
    Invoke-Expression -Command $inlineScript
  }

  if ($azPSVersion -notlike 'latest') {
    Write-Output "##########`nazPSVersion`n##########"
    Install-Module -Name Az -RequiredVersion $azPSVersion
    Import-Module -Name Az -RequiredVersion $azPSVersion
  }
}
Catch {
  $_.Exception.Message
  $_.Exception.ItemName
  Throw
}