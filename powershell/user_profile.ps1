
oh-my-posh init pwsh --config $HOME\.config\powershell\themes\minimalNight.omp.json | Invoke-Expression
Import-Module Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Alias
Set-Alias clr clear
Set-Alias vi nvim
Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias touch New-Item
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
function servers { netstat -ano }
function server([string]$SERVERNAME) { netstat -ano | findstr "$SERVERNAME"}
function la {ls -force}
function drives {gdr -PSProvider 'FileSystem'}
function vdot { cd $HOME/Appdata/Local/nvim }
function vpdot { cd $HOME/Appdata/Local/nvim/after/plugin }
function vldot { cd $HOME/Appdata/Local/nvim/lua/andrem222 }
