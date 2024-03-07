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
        MANAGER = "WINGET"
        CONTAINER = @( # (Name, Id, Path)
            # Package managers <- Required
            @("PowerShell Core", " Microsoft.PowerShell_8wekyb3d8bbwe", "Microsoft.Powershell"),
            @("Git", "Git.Git", "Git.Git"),
            @("NVM", "CoreyButler.NVMforWindows", "CoreyButler.NVMforWindows"),
            @("Python3", "Python.Python.3.12", "Python3")
        )
    }
    
    @{
        TITLE = "Node Versions"
        MANAGER = "NVM"
        CONTAINER = @( # (Name, executable, Path)
            # Node Versions <- Required
            ,@("Node LTS", "", "lts") # Still unsure how to check
        )
    }

    @{
        TITLE = "Scoop MANAGER_INSTALLER"
        MANAGER = "SCOOP_MANAGER"
        CONTAINER = @( # (Name, Command, Path)
            # Package manager <- Required
            ,@("Scoop", "scoop update", "get.scoop.sh")
        )
    }

    # Tools Installations
    @{
        TITLE = "Winget Tools"
        MANAGER = "WINGET"
        CONTAINER = @( # (Name, Id, Path) 
            # Tools
            @("SQLite", "SQLite.SQLite", "SQLite.SQLite"),
            @("Neovim", "Neovim.Neovim", "Neovim"),
            @("Oh My Posh", "JanDeDobbeleer.OhMyPosh", "JanDeDobbeleer.OhMyPosh -s winget"),
            @("Yarn", "Yarn.Yarn", "Yarn.Yarn"),
            @("Fuzzy Finder", "junegunn.fzf", "fzf"),
            @("Bat", "sharkdp.bat", "sharkdp.bat"),
            @("LazyDocker", "JesseDuffield.Lazydocker", "JesseDuffield.Lazydocker"),
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
        MANAGER = "NPM"
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
        MANAGER = "DOTNET"
        CONTAINER = @( # (Name, Id, Path)
            # Server
            ,@("CSharp LS", "csharp-ls", "csharp-ls")
        )
    }

    @{
        TITLE = "Pip Tools"
        MANAGER = "PIP"
        CONTAINER = @( # (Name, Command, Path)
            # Formatter
            ,@("Autopep8", "autopep8", "autopep8")
        )
    }
    
    @{
        TITLE = "Scoop Tools"
        MANAGER = "SCOOP"
        CONTAINER = @( # (Name, Id, Path)
            # Tools
            @("Fira Code Font", "FiraCode-NF-Mono", "nerd-fonts/FiraCode-NF-Mono"),
            @("GCC", "gcc", "gcc")
        )
    }
    
    @{
        TITLE = "PowerShell Tools"
        MANAGER = "POWERSHELL"
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
        MANAGER = "GIT"
        CONTAINER = @( # (Name, Repo, Path)
            # Dot Setup
            @("Windows-Dotfiles", "https://github.com/AndreM222/Windows-Dotfiles.git", ".config"),
            @("PowerShell", "https://github.com/AndreM222/PowerShell.git", "Documents"),
            @("nvim", "https://github.com/AndreM222/nvim.git", "AppData\Local")
        )
    }
    
    @{
        TITLE = "Script Dotfiles"
        MANAGER = "SCRIPT"
        CONTAINER = @( # (Path, File)
            # Dot Setup
            @("AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState", "settings.json"),
            @(".", ".gitconfig")
        )
    }

    @{
        TITLE = "Create Dotfile"
        MANAGER = "CREATE"
        CONTAINER = @( # (File, Content, Path)
            ,@(".czrc", '{ "path": "cz-conventional-changelog" }', ".")
        )
    }
)

Export-ModuleMember -Variable list
