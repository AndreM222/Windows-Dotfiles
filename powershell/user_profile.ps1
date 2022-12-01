# Prompt

oh-my-posh init pwsh --config $HOME\scoop\apps\oh-my-posh\7.93.1\themes\clean-detailed.omp.json | Invoke-Expression
Import-Module Terminal-Icons

# PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Alias

Set-Alias clr clear
Set-Alias vi nvim
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
