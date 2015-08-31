Write-Host "#######################"
Write-Host "-----------------------"
Write-Host "--Bootstrapping Scoop--"
Write-Host "-----------------------"
Write-Host "#######################"
Write-Host

. "./Scoop.Bootstrap.Core.ps1"
. "./Scoop.Settings.ps1"

#install scoop if not present
if (EnsureScoopInstalled) {
  EnsureExtrasBucket
  UpdateScoop
  InstallApps($apps)
  MakePretty($theme)
}
else {
  Write-Host "An error has occurred."
}
