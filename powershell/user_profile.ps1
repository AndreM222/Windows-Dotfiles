# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

#Prompt
oh-my-posh init pwsh --config $HOME\.config\powershell\themes\minimalNight.omp.json | Invoke-Expression
Import-Module Terminal-Icons

# FSf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r' 

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Alias
Set-Alias vi nvim
Set-Alias vim nvim

Set-Alias clr clear
Set-Alias grep findstr
Set-Alias touch New-Item

Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ds drives

Set-Alias g git

function la {ls -force}

function servers { netstat -ano }
function server([string]$SERVERNAME) { netstat -ano | findstr "$SERVERNAME"}
function drives {gdr -PSProvider 'FileSystem'}

function vdot { cd $HOME/Appdata/Local/nvim }
function vpdot { cd $HOME/Appdata/Local/nvim/after/plugin }
function vldot { cd $HOME/Appdata/Local/nvim/lua/andrem222 }
