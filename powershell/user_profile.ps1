# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt
$omp_file = Join-Path $PSScriptRoot "./themes/minimalNight.omp.json"
oh-my-posh init pwsh --config $omp_file | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r' 

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim
  
Set-Alias grep findstr
Set-Alias touch New-Item
  
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ds drives
  
Set-Alias g git
  
function la {ls -force}
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
} 
  
function servers { netstat -ano }
function server([string]$SERVERNAME) { netstat -ano | findstr "$SERVERNAME"}
function drives {gdr -PSProvider 'FileSystem'}
  
function vdot { cd $HOME/Appdata/Local/nvim }
function vpdot { cd $HOME/Appdata/Local/nvim/after/plugin }
function vldot { cd $HOME/Appdata/Local/nvim/lua/andrem222 }
