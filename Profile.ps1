$env:SCOOP = "~/appdata/local/scoop"

#initialise oneget
$oneget = "~\AppData\Local\scoop\apps\oneget\nightly\OneGet.psd1"
if (Test-Path $oneget) {
  Import-Module $oneget
}
else {
  Write-Host "Unable to initialise OneGet: Not installed or path not found."
}

#prefer busybox ls
Remove-Item alias:/ls
Remove-Item alias:/rm
Set-Alias mkdir mkdir.ps1 -scope local -option private

#if work dir subst has been called
if (Test-Path w:) {
  Set-Location w:
}
