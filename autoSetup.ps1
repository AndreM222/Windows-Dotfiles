if($env:OS -notlike "*Windows*")
{ 
    exit 
}
exit

# -- Exe Installations --

# Package Managers - Winget
$packManagers = @( # (Name, executable, Path)
    @("PowerShell Core", "pwsh", "Microsoft.Powershell"),
    @("Git", "git", "Git.Git"),
    @("NVM", "nvm", "CoreyButler.NVMforWindows"),
    @("Python", "py", "Python3")
)

$npmVersions = @( # (Name, executable, Path)
    ,@("NPM LTS", "nvm use lts", "lts")
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
    @("Lua Language Server", "lua-language-server", "lua-language-server"),
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
    ,@("CSharp-LS", "csharp-ls", "csharp-ls")
)

$pipList = @( # (Name, executable, Path)
    # Formatter
    ,@("Autopep8", "autopep8", "autopep8")
)

# -- List Installations --

# Tools Installations

$scoopPathList = @( # (Name, Id, Path)
    @("Fira Code Font", "FiraCode-NF-Mono", "nerd-fonts/FiraCode-NF-Mono"),
    @("GCC", "gcc", "gcc")
)

$powerList = @( # (Name, Id, Path)
    @("PSFzf", "PSFzf", "PSFzf"),
    @("Posh-Git", "posh-git", "posh-git"),
    @("Terminal-Icons", "Terminal-Icons", "Terminal-Icons"),
    @("PSReadline", "PSReadLine", "PSReadLine"),
    @("Z", "z", "z")
)

$gitDotfileList = @( # (Name, Repo, Path)
    @("PowerShell", "https://github.com/AndreM222/PowerShell.git", "Documents"),
    @("nvim", "https://github.com/AndreM222/nvim.git", "AppData\Local")
)

$scriptDotfileList = @( # (Path, File)
    @("AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState", "settings.json"),
    @(".", ".gitconfig")
)

#region Functions
function errorCheck($code, $title, $count)
{
    if($count -eq 2 || $count -eq 3)
    {
        Write-Host "Setup Failed [$count/3], Trying again ..." -ForegroundColor DarkRed
    }
    if($count -eq 4)
    {
        Write-Host "Setup Failed [X]" -ForegroundColor DarkRed
        Write-Host "Error[$code]: $title" -ForegroundColor DarkRed
        return $false
    }

    return $true
}

function warnMSG($title)
{
    Write-Host "[WARNING!: This might replace any setup you had] " -NoNewline -InformationAction $InformationPreference -ForegroundColor Yellow
    Write-Host "Are you sure you want to use my " -NoNewLine
    Write-Host "$title" -NoNewLine  -ForegroundColor Cyan
    Write-Host " setup? [Y] Yes [N] No (Default is Y): " -NoNewline

    $answer = ""

    do
    {
        $answer = (Read-Host).ToUpper()
    } while(@("", "N", "NO", "Y", "YE", "YES") -notcontains $answer)
    
    if($answer[0] -eq "N") 
    {
        Write-Host "৹ Setup Canceled [C]" -ForegroundColor red
        return $false
    }
    Write-Host "Setting Up $title ..."
    return $true
}

function installerExe($manager, $list) # Check with exe
{
    foreach($curr in $list)
    {
        $count = 0
        while(errorCheck 50 $curr[0] $count)
        {
            try
            {
                $curr[1] | Out-Null
                Write-Host "৹ $($curr[0]) Is Installed [✓]" -ForegroundColor Green
                break
            } catch [System.Management.Automation.CommandNotFoundException]
            {
                Write-Host "Installing $($curr[0]) ..."
                Invoke-Expression "$manager $($curr[2])"
            }

            $count++
        }
    }
}

function installerSearch($finder, $manager, $list) # Check with list
{
    foreach ($curr in $list)
    {
        $count = 0
        while(errorCheck 60 $curr[0] $count)
        {
            if(Invoke-Expression "$finder $($curr[1])")
            {
                Write-Host "৹ $($curr[0]) Is Installed [✓]" -ForegroundColor Green
                break
            } else
            {
                Write-Host "Installing $($curr[0]) ..."
                Invoke-Expression "$manager $($curr[2])"
            }

            $count++
        }
    }
}

function gitRepoSetup($list) # Setup From Git Repos
{
    $pos = Get-Location
    foreach($curr in $list)
    {
        if(Test-Path -Path "$HOME\OneDrive\$($curr[2])\") # Check if in OneDrive
        {
            $curr[2] = "$HOME\OneDrive\$($curr[2])" # Change path to onedrive
        } else
        {
            $curr[2] = "$HOME\$($curr[2])" # Set normal path
        }

        Set-Location "$($curr[2])\$($curr[0])\"

        $gitCheck = git config --get remote.origin.url
        $userResponse = $true

        Set-Location $pos


        if($gitCheck -ne $curr[1])
        {
            $userResponse = warnMSG "$($curr[0])"

            if($userResponse)
            {
                $count = 0
                while(errorCheck 70 curr[0] $count)
                {
                    if(git clone $curr[1] $tmpGitDotfile)
                    {
                        Move-Item -r -force tmpGitDotfile\* "$($curr[2])\$($curr[0])"
                        Remove-Item -r -force tmpGitDotfile
                        break
                    }

                    $count++
                }
            }
        }

        if($userResponse)
        {
            Write-Host "৹ Setup $($curr[0]) Completed [✓]" -ForegroundColor Green
        }
    }

}

function scriptSetup($list)
{
    foreach($curr in $list)
    {
        $userResponse = warnMSG $curr[1]
        if($userResponse)
        {
            Copy-Item -force ".\$($curr[1])" "$HOME\$($curr[0])"
        }
        if($userResponse)
        {
            Write-Host "৹ Setup Completed [✓]" -ForegroundColor Green
        }
    }
}
#endregion Functions

#region Package Manager Setup
installerExe "winget install" $packManagers

installerExe "Invoke-RestMethod" @(,@("Scoop", "scoop", "get.scoop.sh"))

installerExe "nvm install" $npmVersions
#endregion Package Manager Setup



#region Setup Installations
# -- Winget
installerExe "winget install" $winList

# -- Scoop
installerSearch "scoop list" "scoop install" $scoopPathList

# -- NPM
installerExe "npm install -g" $npmList
Write-Output '{ "path": "cz-conventional-changelog" }' > ~/.czrc # Set Commitizen Path

# -- Dotnet
installerExe "dotnet tool install -g" $dotnetList

# -- PIP
installerExe "pip install --upgrade" $pipList

# -- PowerShell
installerSearch "Get-Module -ListAvailable" "Install-Module -Force" $powerList
#endregion Setup Tools



#region Git Setups
gitRepoSetup $gitDotfileList
#endregion Git Setups



#region Terminal Config Setup
scriptSetup $scriptDotfileList
