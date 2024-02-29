@{
    # -- Exe Installations --
    packManagers = @( # (Name, executable, Path)
        @("PowerShell Core", "pwsh", "Microsoft.Powershell"),
        @("Git", "git", "Git.Git"),
        @("NVM", "nvm", "CoreyButler.NVMforWindows"),
        @("Python", "py", "Python3")
    )

    npmVersions = @( # (Name, executable, Path)
        ,@("NPM LTS", "nvm use lts", "lts")
    )

    # Tools Installations
    winList = @( # (Name, executable, Path) 
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

    npmList = @( # (Name, executable, Path)
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

    dotnetList = @( # (Name, executable, Path)
        # Server
        ,@("CSharp-LS", "csharp-ls", "csharp-ls")
    )

    pipList = @( # (Name, executable, Path)
        # Formatter
        ,@("Autopep8", "autopep8", "autopep8")
    )

    # -- List Installations --

    # Tools Installations

    scoopPathList = @( # (Name, Id, Path)
        @("Fira Code Font", "FiraCode-NF-Mono", "nerd-fonts/FiraCode-NF-Mono"),
        @("GCC", "gcc", "gcc")
    )

    powerList = @( # (Name, Id, Path)
        @("PSFzf", "PSFzf", "PSFzf"),
        @("Posh-Git", "posh-git", "posh-git"),
        @("Terminal-Icons", "Terminal-Icons", "Terminal-Icons"),
        @("PSReadline", "PSReadLine", "PSReadLine"),
        @("Z", "z", "z")
    )

    gitDotfileList = @( # (Name, Repo, Path)
        @("PowerShell", "https://github.com/AndreM222/PowerShell.git", "Documents"),
        @("nvim", "https://github.com/AndreM222/nvim.git", "AppData\Local")
    )

    scriptDotfileList = @( # (Path, File)
        @("AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState", "settings.json"),
        @(".", ".gitconfig")
    )
}
