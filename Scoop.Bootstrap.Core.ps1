function EnsureScoopInstalled {
  try {
    if ((gcm scoop -ea silentlycontinue) -eq $null) {
      invoke-webrequest https://get.scoop.sh | select -expandproperty content | iex
    }
    return $true
  }
  catch { }

  return $false
}

function InstallApps($apps) {
  $installed = scoop list | select -skip 1 |% { $_.trim().split(' ')[0] }
  foreach ($app in $apps) {
    if ($installed -contains $app) {
      scoop update -q $app
    }
    else {
      scoop install $app
    }
  }
}

function MakePretty($theme) {
  InstallApps("concfg", "pshazz")
  sudo iex "concfg clean; sudo concfg import $theme big --non-interactive"
}

function EnsureExtrasBucket {
  InstallApps("7zip", "git")
  $buckets = scoop bucket list
  if (-not ($buckets -contains 'extras')) {
    scoop bucket add extras
  }
}

function UpdateScoop {
  scoop update
}
