Write-Host "#######################"
Write-Host "-----------------------"
Write-Host "--Bootstrapping Scoop--"
Write-Host "-----------------------"
Write-Host "#######################"
Write-Host

. "$psscriptroot/Scoop.Bootstrap.Core.ps1"
. "$psscriptroot/Scoop.Settings.ps1"

#install scoop if not present
if (EnsureScoopInstalled) {
  InstallApps $globalApps $true
  EnsureExtrasBucket
  UpdateScoop
  InstallApps($apps)
  MakePretty($theme)
}
else {
  Write-Host "An error has occurred."
}
