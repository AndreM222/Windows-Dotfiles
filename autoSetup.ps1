if($env:OS -notlike "*Windows*") { exit }

# Package Managers - Winget
$packManagers = @(
    # (Name, executable, Path)
    @("PowerShell Core", "pwsh", "Microsoft.Powershell"),
    @("Git", "git", "Git.Git"),
    @("Python", "py", "Python")
)

# Winget Installations
$winTools = @(
    # Path
    "gsudo jqlang.jq",
    "SQLite.SQLite",
    "Neovim",
    "JanDeDobbeleer.OhMyPosh -s winget",
    "Yarn.Yarn",
    "GnuWin32.Make",
    "fzf",
    "sharkdp.bat",
    "lazydocker",
    "ntop",
    "BurntSushi.ripgrep.MSVC",
    "lazygit"
)

$scoopTools = @(
    # (Bucket, Path)
    @("nerd-fonts", "FiraCode-NF-Mono")
)

$npmTools = @(
    # Path
    "commitizen",
    "cz-conventional-changelog",
    "generate generate-license",
    "npm-check-updates"
)



#region Package Manager Setup
foreach ($curr in $packManagers)
{
    while($true)
    {
        try
        {
            $curr[1] | Out-Null
            Write-Host "$curr[0] Is Installed [✓]" -ForegroundColor Green
            break
        } catch [System.Management.Automation.CommandNotFoundException]
        {
            Write-Host "$curr[0] Is Installed [X]" -ForegroundColor Red
            Write-Host "Installing $curr[0] ..."
            winget install $curr[2] 
        }
    }
}
while($true)
{
    try
    {
        scoop | Out-Null 
        Write-Host "Scoop Is Installed [✓]" -ForegroundColor Green 
        break
    } catch [System.Management.Automation.CommandNotFoundException]
    {
        Write-host "Scoop Is Installed [X]" -ForegroundColor Red 
        Write-Host "Installing Scoop ..."
        Invoke-RestMethod get.scoop.sh | Invoke-Expression 
    }
}
while($true)
{
    try
    {
        npm | Out-Null
        Write-Host "NodeJS Is Installed [✓]" -ForegroundColor Green
        break
    } catch [System.Management.Automation.CommandNotFoundException]
    {
        Write-Host "NodeJS Is Installed [X]" -ForegroundColor Red
        Write-Host "Installing NodeJS ..."
        winget install CoreyButler.NVMforWindows
        nvm install lts
        nvm use lts
    }
}
#endregion Package Manager Setup



#region Setup Tools
# -- Winget
foreach($curr in $winTools)
{
    winget install $curr
}

# -- Scoop
foreach($curr in $scoopTools)
{
    scoop bucket add $curr[0]
    scoop install $curr[1]
}

# -- NPM
foreach($curr in $npmTools)
{
    npm install -g  $curr
}
Write-Output '{ "path": "cz-conventional-changelog" }' > ~/.czrc
#endregion Setup Tools



#region PowerShell Config And Modules Setup
# Setup PowerShell file in its respective place
git clone https://github.com/AndreM222/PowerShell.git

if(Test-Path -Path $HOME\OneDrive\Documents)
{
    Move-Item -r -force .\PowerShell $HOME\Documents\
} else
{
    Move-Item -r -force .\PowerShell $HOME\OneDrive\Documents\
}

# Tools
Install-Module -Name PSFzf
Install-Module posh-git -Scope CurrentUser
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module PSReadLine -AllowPrerelease -Force
Install-Module -Name z
#endregion PowerShell Config And Modules Setup



#region NVIM Config Setup
git clone https://github.com/AndreM222/nvim.git
Move-Item -r -force nvim $HOME\AppData\Local\
#endregion NVIM Setup

#region Terminal Config Setup
Move-Item -force .\TerminalConfig\settings.json $HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\
#endregion Terminal Config Setup

#region .gitconfig Setup
Move-Item -force .\.gitconfig $HOME
#endregion .gitconfig Setup
