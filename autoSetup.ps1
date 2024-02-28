if($env:OS -notlike "*Windows*")
{ 
    exit 
}

# -- Exe Installations --

# Package Managers - Winget
$packManagers = @( # (Name, executable, Path)
    @("PowerShell Core", "pwsh", "Microsoft.Powershell"),
    @("Git", "git", "Git.Git"),
    @("NVM", "nvm", "CoreyButler.NVMforWindows"),
    @("Python", "py", "Python3")
)

$packScoop = @( # (Name, executable, Path)
    @("Scoop", "scoop", "get.scoop.sh")
)

$npmVersions = @( # (Name, executable, Path)
    @("NPM", "nvm use lts", "lts")
)

# Tools Installations
$winList = @( # (Name, executable, Path) 
    # Tools
    @("SQLite", "sqlite3", "SQLite.SQLite"),
    @("Neovim", "nvim", "Neovim"),
    @("Oh My Posh", "oh-my-posh", "JanDeDobbeleer.OhMyPosh -s winget"),
    @("Yarn", "yarn", "Yarn.Yarn"),
    @("Fuzzy Finder", "fzf", "fzf"),
    @("Bat", "bat", "sharkdp.bat"),
    @("LazyDocker", "lazydocker", "lazydocker"),
    @("NTop", "ntop", "ntop"),
    @("RipGrep", "rg", "BurntSushi.ripgrep.MSVC"),
    @("LazyGit", "lazygit", "lazygit"),
    # Server
    @("Clangd", "clangd", "clangd"),
    @("Lua Language Server", "lua-language-server", "lua-language-server")
    @("LLVM", "llvm", "-i LLVM.LLVM")
)

$npmList = @( # (Name, executable, Path)
    # Tools
    @("Commitizen", "commitizen", "commitizen cz-conventional-changelog"),
    @("Generate-License", "generate", "generate generate-license"),
    @("Npm-Check-Updates", "npm-check-updates", "npm-check-updates"),
    # Server
    @("Live-server", "live-server", "live-server"),
    @("Pyright", "pyright", "pyright"),
    @("Typescript-Language-Server", "typescript-language-server", "typescript typescript-language-server"),
    @("Tailwindcss-Language-Server", "tailwindcss-language-server", "tailwindcss-language-server"),
    # Formatter
    @("prettier", "prettier", "prettier")
)

$dotnetList = @( # (Name, executable, Path)
    # Server
    @("CSharp-LS", "csharp-ls", "csharp-ls")
)

$pipList = @( # (Name, executable, Path)
    # Formatter
    @("Autopep8", "autopep8", "autopep8")
)

# -- List Installations --

# Tools Installations
$scoopBucketList = @( # (Name, Path)
    @("Nerd Fonts", "nerd-fonts")
)

$scoopPathList = @( # (Name, Path)
    @("Fira Code Font", "FiraCode-NF-Mono")
)

$powerList = @(
    @("PS Fzf", "PSFzf"),
    @("Posh Git", "posh-git -Scope CurrentUser"),
    @("Terminal Icons", "Terminal-Icons -Repository PSGallery"),
    @("PS Readline", "PSReadLine -AllowPrerelease"),
    @("Z", "z")
)

#region Functions
function warnMSG($title)
{
    Write-Host "Setup Completed [X]"; 

    Write-Host "[WARNING!: This might replace any setup you had] " -NoNewline -InformationAction $InformationPreference -ForegroundColor Yellow
    Write-Host "Are you sure you want to use my $title setup?" -NoNewLine 
    Write-Host "[Y] Yes [N] No (Default is Y): "

    $answer = ""

    do
    {
        $answer = (Read-Host).ToUpper()
    } while(@("", "N", "NO", "Y", "YE", "YES") -notcontains $answer)
    
    if($answer[0] -eq "N") 
    {
        Write-Host "Setup Canceled [X]" -ForegroundColor red
        return $false
    }
    Write-Host "Setting Up $title ..."
    return $true
}

function installerExe($manager, $list) # Check with exe
{
    foreach($curr in $list)
    {
        while($true)
        {
            try
            {
                $curr[1] | Out-Null
                Write-Host "$($curr[0]) Is Installed [✓]" -ForegroundColor Green
                break
            } catch [System.Management.Automation.CommandNotFoundException]
            {
                Write-Host "$($curr[0]) Is Installed [X]"
                Write-Host "Installing $($curr[0]) ..."
                Invoke-Expression "$manager $($curr[2])"
            }
        }
    }
}

function installerList($finder, $manager, $list) # Check with list
{
    foreach ($curr in $list)
    {
        while($true)
        {
            if(Invoke-Expression "$finder $($curr[1])")
            {
                Write-Host "$($curr[0]) Is Installed [✓]" -ForegroundColor Green
                break
            } else
            {
                Write-Host "$($curr[0]) Is Installed [X]"
                Write-Host "Installing $($curr[0]) ..."
                Invoke-Expression "$manager $($curr[1])"
            }
        }
    }
}

function gitRepoSetup($repo, $path, $directory) # Setup From Git Repos
{
    $curr = Get-Location
    Set-Location "$path$directory"

    $currPath = git config --get remote.origin.url
    $userResponse = $true

    if($currPath -ne $repo)
    {
        $userResponse = warnMSG "$directory"

        if($userResponse)
        {
            git clone $repo $tmpGitDotfile
            Move-Item -r -force tmpGitDotfile/* "$path$directory"
            Remove-Item -r -force tmpGitDotfile
        }
    }

    if($userResponse)
    {
        Write-Host "Setup Completed [✓]" -ForegroundColor Green
    }

    Set-Location $curr
}

function fileChange($path, $file)
{
    $userResponse = warnMSG $file
    if($userResponse)
    {
        Copy-Item -force ".\$file" $path
    }

    if($userResponse)
    {
        Write-Host "Setup Completed [✓]" -ForegroundColor Green
    }
}
#endregion Functions

#region Package Manager Setup
installerExe "winget install" $packManagers

installerExe "Invoke-RestMethod" $packScoop

installerExe "nvm install" $npmVersions
#endregion Package Manager Setup



#region Setup Installations
# -- Winget
installerExe "winget install" $winList

# -- Scoop
installerList "scoop list" "scoop install" $scoopPathList
installerList "scoop search" "scoop bucket add" $scoopBucketList

# -- NPM
installerExe "npm install -g" $npmList
Write-Output '{ "path": "cz-conventional-changelog" }' > ~/.czrc # Set Commitizen Path

# -- Dotnet
installerExe "dotnet tool install -g" $dotnetList

# -- PIP
installerExe "pip install --upgrade" $pipList

#endregion Setup Tools



#region PowerShell Config And Modules Setup
# Setup PowerShell file in its respective place
if(Test-Path -Path $HOME\OneDrive\Documents)
{
    gitRepoSetup "https://github.com/AndreM222/PowerShell.git" "$HOME\OneDrive\Documents\" "PowerShell"

} else
{
    gitRepoSetup "https://github.com/AndreM222/PowerShell.git" "$HOME\Documents\" "PowerShell"
}

# -- PowerShell Tools
installerList "Get-Module -ListAvailable" "Install-Module -Force" $powerList
#endregion PowerShell Config And Modules Setup



#region NVIM Config Setup
gitRepoSetup "https://github.com/AndreM222/nvim.git" "$HOME\AppData\Local\" "nvim"
#endregion NVIM Setup

#region Terminal Config Setup
fileChange "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\" "settings.json"
#endregion Terminal Config Setup

#region .gitconfig Setup
fileChange $HOME ".gitconfig"
#endregion .gitconfig Setup
