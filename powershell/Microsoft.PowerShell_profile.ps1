# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt
Import-Module -Name Terminal-Icons

$omp_file = Join-Path $PSScriptRoot "./themes/minimalNight.omp.json"
oh-my-posh init pwsh --config $omp_file | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History

Set-PSReadLineKeyHandler -Chord 'Ctrl+a' -Function SelectAll
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+Backspace' -Function DeleteChar
Set-PSReadLineKeyHandler -Chord 'Ctrl+LeftArrow' -Function BackwardWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+RightArrow' -Function ForwardWord

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r' 

$env:FZF_DEFAULT_OPTS="--color=fg:#f8f8f2,hl:#bd93f9,gutter:-1 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#8be9fd,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

# Bat
$env:BAT_THEME="Dracula"

# Alias
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim

Set-Alias grep findstr
Set-Alias touch New-Item

Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ds drives

Set-Alias wget Invoke-WebRequest

Set-Alias zip Compress-Archive
Set-Alias unzip Expand-Archive

Set-Alias g git

function rmf ($path){ rm -force $path }

function la { ls -force @args }

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
} 

function server([string]$SERVERNAME) { 
    if ($SERVERNAME) { netstat -ano | findstr "$SERVERNAME" }
    else { netstat -ano }
}

function drives { gdr -PSProvider 'FileSystem' }

# Git
Import-Module posh-git
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"
