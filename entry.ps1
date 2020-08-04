Param( 
  [string]$inlineScript,
  [string]$script,
  [string]$azPSVersion = 'latest'
)

Write-Output "############"
Write-Output "InvocationName:" $MyInvocation.InvocationName
Write-Output "Path:" $MyInvocation.MyCommand.Path
Write-Output "Script:" $PSCommandPath
Write-Output "Path:" $PSScriptRoot

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

  if ($inlineScript) {
    Write-Output "##########`ninlineScript`n"
    Invoke-Expression -Command $script
  }

  if ($azPSVersion -eq 'latest') {
    Write-Output "##########`nazPSVersion`n##########"
    Write-Output "##########`nUse latest"
  } else {
    Install-Module -Name Az -RequiredVersion $azPSVersion
    Import-Module -Name Az -RequiredVersion $azPSVersion
  }

}
Catch {
  $_.Exception.Message
  $_.Exception.ItemName
  Throw
}