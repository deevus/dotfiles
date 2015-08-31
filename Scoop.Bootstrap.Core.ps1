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

function InstallApps($apps, $global) {
  $installed = scoop list | select -skip 1 |% { $_.trim().split(' ')[0] }
  if ($global) {
    $installArgs = "-g"
    $cmd = "sudo scoop"
  } else {
    $cmd = "scoop"
  }

  foreach ($app in $apps) {
    if ($installed -contains $app) {
      iex "$cmd update -q $app $installArgs"
    }
    else {
      iex "$cmd install $app $installArgs"
    }
  }
}

function MakePretty($theme) {
  InstallApps("concfg", "pshazz")
  sudo iex "concfg clean; sudo concfg import $theme big --non-interactive"
}

function EnsureExtrasBucket {
  InstallApps("git")
  $buckets = scoop bucket list
  if (-not ($buckets -contains 'extras')) {
    scoop bucket add extras
  }
}

function UpdateScoop {
  scoop update
}
