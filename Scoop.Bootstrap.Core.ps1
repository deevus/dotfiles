function TryInstallScoop {
  try {
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
    return $true
  } 
  catch {
    return $false
  } 
  return $false
}

function InstallApps($apps) {
  foreach ($app in $apps) {
    scoop install $app
  }
}

function MakePretty($theme) {
  scoop install concfg
  concfg import $theme small --non-interactive
  scoop install pshazz
}

function AddExtrasBucket {
  InstallApps("7zip", "git")
  scoop bucket add extras
}