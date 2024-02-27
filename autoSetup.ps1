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
function installerExe # Check with exe
{
    param ($manager, $list)

    foreach ($curr in $list)
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
                Write-Host "$curr[0] Is Installed [X]"
                Write-Host "Installing $curr[0] ..."
                Invoke-Expression "$manager $curr[2]"
            }
        }
    }
}

function installerList # Check with list
{
    param ($finder, $manager, $list)

    foreach ($curr in $list)
    {
        while($true)
        {
            if(Invoke-Expression "$finder $curr[1]")
            {
                Write-Host "$curr[0] Is Installed [✓]" -ForegroundColor Green
                break
            } else
            {
                Write-Host "$curr[0] Is Installed [X]"
                Write-Host "Installing $curr[0] ..."
                Invoke-Expression "$manager $curr[1]"
            }
        }
    }
}

function gitRepoSetup
{
    param ($repo, $path, $title)
    $curr = Get-Location
    Set-Location '$path$title'

    $currPath = git config --get remote.origin.url

    if($currPath -ne $repo)
    {
        Write-Host "Setup Completed [X]"
        Write-Host "Replacing Setup ..."
        Remove-Item -r -force $path
        git clone $repo $path
    }

    Set-Location $curr
    Write-Host "Setup Completed [✓]" -ForegroundColor Green
}

function fileChange
{
    param($path, $file)

    if(Test-Path -Path '$path$file')
    {
        Write-Host "File Exists [✓]" -ForegroundColor Green
    } else
    {
        Write-Host "File Exists [X]"
        Write-Host "Creating File ..."
        Copy-Item -force '.\$file' $path
    }
}
#endregion Functions

#region Package Manager Setup
installerExe("winget install", $packManagers)
installerExe("Invoke-RestMethod", @("Scoop", "scoop", "get.scoop.sh"))
installerExe("nvm", @("NPM", "npm", " install lts; nvm use lts"))
#endregion Package Manager Setup



#region Setup Installations
# -- Winget
installerExe("winget install", $winList)

# -- Scoop
installerList("scoop list", "scoop install", $scoopPathList)
installerList("scoop search", "scoop bucket add", $scoopBucketList)

# -- NPM
installerExe("npm install -g", $npmList)
Write-Output '{ "path": "cz-conventional-changelog" }' > ~/.czrc # Set Commitizen Path

# -- Dotnet
installerExe("dotnet tool install -g", $dotnetList)

# -- PIP
installerExe("pip install --upgrade", $pipList)

#endregion Setup Tools



#region PowerShell Config And Modules Setup
# Setup PowerShell file in its respective place
if(Test-Path -Path $HOME\OneDrive\Documents)
{
    gitRepoSetup('https://github.com/AndreM222/PowerShell.git', '$HOME\OneDrive\Documents\', 'PowerShell')
} else
{
    gitRepoSetup('https://github.com/AndreM222/PowerShell.git', '$HOME\Documents\', 'PowerShell')
}

# -- PowerShell Tools
installerList("Get-Module -ListAvailable", "Install-Module -Force", $powerList)
#endregion PowerShell Config And Modules Setup



#region NVIM Config Setup
gitRepoSetup('https://github.com/AndreM222/nvim.git', '$HOME\AppData\Local\', 'nvim')
#endregion NVIM Setup

#region Terminal Config Setup
fileChange('$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\', 'settings.json')
#endregion Terminal Config Setup

#region .gitconfig Setup
fileChange($HOME, '.gitconfig')
#endregion .gitconfig Setup
