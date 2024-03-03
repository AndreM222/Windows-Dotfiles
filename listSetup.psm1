[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUserDeclaredVarsMoreThanAssignments', '', Scope='Function')] # <- Ignore Undeclared list variable
[Object] $list = @(
    #region [Warning] Read the following before making any changes

    # (For any package manager, the package must be added to the list of package managers)

    # [Setup for installation types]
    #   - Search: Search for the package in the package manager <- Most of the times the answer
    #   - Command: Command to install the package <- Sometimes the answer
    #   - Executable: Run the executable <- Rarely the answer: [Try not to use]

    # [Setup For Dotfile Types]
    #   - Git: Git Repository to clone <- Sometimes the answer
    #   - Create: Create a file with the given content <- Rarely the answer

    #endregion [Warning] Read the following before making any changes

    # Pre-Requisites
    @{
        TITLE = "Package Managers"
        INSTALL_TYPE = "Search"
        MANAGER = "Winget Install"
        FINDER = "Winget List --id"
        CONTAINER = @( # (Name, Id, Path)
            # Package Managers <- Required
            @("PowerShell Core", " Microsoft.PowerShell_8wekyb3d8bbwe", "Microsoft.Powershell"),
            @("Git", "Git.Git", "Git.Git"),
            @("NVM", "CoreyButler.NVMforWindows", "CoreyButler.NVMforWindows"),
            @("Python3", "Python.Python.3.12", "Python3")
        )
    }
    
    @{
        TITLE = "Node Versions"
        INSTALL_TYPE = "Executable"
        MANAGER = "NVM Install"
        CONTAINER = @( # (Name, executable, Path)
            # Node Versions <- Required
            ,@("Node LTS", "nvm use lts", "lts")
        )
    }

    @{
        TITLE = "Scoop Manager"
        INSTALL_TYPE = "Command"
        MANAGER = "Invoke-RestMethod"
        CONTAINER = @( # (Name, Command, Path)
            # Package Manager <- Required
            ,@("Scoop", "scoop update", "get.scoop.sh")
        )
    }

    # Tools Installations
    @{
        TITLE = "Winget Tools"
        INSTALL_TYPE = "Search"
        MANAGER = "Winget Install"
        FINDER = "Winget List --id"
        CONTAINER = @( # (Name, Id, Path) 
            # Tools
            @("SQLite", "SQLite.SQLite", "SQLite.SQLite"),
            @("Neovim", "Neovim.Neovim", "Neovim"),
            @("Oh My Posh", "JanDeDobbeleer.OhMyPosh", "JanDeDobbeleer.OhMyPosh -s winget"),
            @("Yarn", "Yarn.Yarn", "Yarn.Yarn"),
            @("Fuzzy Finder", "junegunn.fzf", "fzf"),
            @("Bat", "sharkdp.bat", "sharkdp.bat"),
            @("LazyDocker", "JesseDuffield.Lazydocker", "lazydocker"),
            @("NTop", "gsass1.NTop", "ntop"),
            @("RipGrep", "BurntSushi.ripgrep.MSVC", "BurntSushi.ripgrep.MSVC"),
            @("LazyGit", "JesseDuffield.lazygit", "lazygit"),
            # Server
            @("Clangd", "LLVM.clangd", "clangd"),
            @("Lua Language Server", "LuaLS.lua-language-server", "lua-language-server"),
            @("LLVM", "LLVM.LLVM", "-i LLVM.LLVM")
        )
    }
    
    @{
        TITLE = "NPM Tools"
        INSTALL_TYPE = "Search"
        MANAGER = "npm install -g"
        FINDER = "npm list -g"
        CONTAINER = @( # (Name, Id, Path)
            # Tools
            @("Commitizen", "commitizen", "commitizen cz-conventional-changelog"),
            @("Generate", "generate", "generate"),
            @("Generate License", "generate-license", "generate-license"),
            @("Npm Check Updates", "npm-check-updates", "npm-check-updates"),
            # Server
            @("Live Server", "live-server", "live-server"),
            @("Pyright", "pyright", "pyright"),
            @("Typescript Language Server", "typescript-language-server", "typescript-language-server"),
            @("Typescript", "typescript", "typescript"),
            @("Tailwindcss Language Server", "tailwindcss-language-server", "tailwindcss-language-server"),
            # Formatter
            @("prettier", "prettier", "prettier")
        )
    }
    
    @{
        TITLE = "Dotnet Tools"
        INSTALL_TYPE = "Search"
        MANAGER = "dotnet tool install -g"
        FINDER = "dotnet tool list -g"
        CONTAINER = @( # (Name, Id, Path)
            # Server
            ,@("CSharp LS", "csharp-ls", "csharp-ls")
        )
    }

    @{
        TITLE = "Pip Tools"
        INSTALL_TYPE = "Search"
        MANAGER = "Pip Install"
        FINDER = "Pip show"
        CONTAINER = @( # (Name, Command, Path)
            # Formatter
            ,@("Autopep8", "autopep8", "autopep8")
        )
    }
    
    @{
        TITLE = "Scoop Tools"
        INSTALL_TYPE = "Search"
        MANAGER = "Scoop Install"
        FINDER = "Scoop List"
        CONTAINER = @( # (Name, Id, Path)
            # Tools
            @("Fira Code Font", "FiraCode-NF-Mono", "nerd-fonts/FiraCode-NF-Mono"),
            @("GCC", "gcc", "gcc")
        )
    }
    
    @{
        TITLE = "PowerShell Tools"
        INSTALL_TYPE = "Search"
        MANAGER = "Install-Module -Force"
        FINDER = "Get-Module -ListAvailable"
        CONTAINER = @( # (Name, Id, Path)
            # Tools
            @("PSFzf", "PSFzf", "PSFzf"),
            @("Posh Git", "posh-git", "posh-git -Scope CurrentUser"),
            @("Terminal Icons", "Terminal-Icons", "Terminal-Icons -Repository PSGallery"),
            @("PSReadline", "PSReadLine", "PSReadLine -AllowPrereleas"),
            @("Z", "z", "z")
        )
    }
    
    # Dotfiles Setup
    @{
        TITLE = "Git Dotfiles"
        INSTALL_TYPE = "Git"
        CONTAINER = @( # (Name, Repo, Path)
            # Dot Setup
            @("Windows-Dotfiles", "https://github.com/AndreM222/Windows-Dotfiles.git", ".config"),
            @("PowerShell", "https://github.com/AndreM222/PowerShell.git", "Documents"),
            @("nvim", "https://github.com/AndreM222/nvim.git", "AppData\Local")
        )
    }
    
    @{
        TITLE = "Script Dotfiles"
        INSTALL_TYPE = "Script"
        CONTAINER = @( # (Path, File)
            # Dot Setup
            @("AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState", "settings.json"),
            @(".", ".gitconfig")
        )
    }
    @{
        TITLE = "Create Dotfile"
        INSTALL_TYPE = "Create"
        CONTAINER = @( # (File, Content, Path)
            ,@(".czrc", '{ "path": "cz-conventional-changelog" }', ".")
        )
    }
)

Export-ModuleMember -Variable list
