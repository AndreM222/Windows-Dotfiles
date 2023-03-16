#Prompt

oh-my-posh init pwsh --config $HOME\scoop\apps\oh-my-posh\7.94.1\themes\minimalNight.omp.json | Invoke-Expression
Import-Module Terminal-Icons

# PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Alias

Set-Alias clr clear
Set-Alias vi nvim
Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
function la {ls -force}
function drives {gdr -PSProvider 'FileSystem'}
