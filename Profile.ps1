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
Remove-Item alias:/cat
Set-Alias mkdir mkdir.ps1 -scope local -option private
Set-Alias git hub

#if work dir subst has been called
if (Test-Path w:) {
  Set-Location w:
}

function fuck { 
    $fuck = $(thefuck (get-history -count 1).commandline)
    if($fuck.startswith("echo")) { 
        $fuck.substring(5) 
    } 
    else { iex "$fuck" } 
}

function bg() { Start-Process -NoNewWindow @args }
