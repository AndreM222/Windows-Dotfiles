@{
    packManagers = @( # (Name, Id, Path)
        # Package Managers <- Required
        @("PowerShell Core", " Microsoft.PowerShell_8wekyb3d8bbwe", "Microsoft.Powershell"),
        @("Git", "Git.Git", "Git.Git"),
        @("NVM", "CoreyButler.NVMforWindows", "CoreyButler.NVMforWindows"),
        @("Python3", "Python.Python.3.12", "Python3")
    )

    npmVersions = @( # (Name, executable, Path)
        # Node Versions <- Required
        ,@("NPM LTS", "nvm use lts", "lts")
    )

    # Tools Installations
    winList = @( # (Name, Id, Path) 
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

    npmList = @( # (Name, executable, Path)
        # Tools
        @("Commitizen", "commitizen", "commitizen cz-conventional-changelog"),
        @("Generate License", "generate", "generate generate-license"),
        @("Npm Check Updates", "npm-check-updates", "npm-check-updates"),
        # Server
        @("Live Server", "live-server", "live-server"),
        @("Pyright", "pyright", "pyright"),
        @("Typescript Language Server", "typescript-language-server", "typescript typescript-language-server"),
        @("Tailwindcss Language Server", "tailwindcss-language-server", "tailwindcss-language-server"),
        # Formatter
        @("prettier", "prettier", "prettier")
    )

    dotnetList = @( # (Name, executable, Path)
        # Server
        ,@("CSharp LS", "csharp-ls", "csharp-ls")
    )

    pipList = @( # (Name, executable, Path)
        # Formatter
        ,@("Autopep8", "autopep8", "autopep8")
    )

    scoopPathList = @( # (Name, Id, Path)
        # Tools
        @("Fira Code Font", "FiraCode-NF-Mono", "nerd-fonts/FiraCode-NF-Mono"),
        @("GCC", "gcc", "gcc")
    )

    powerList = @( # (Name, Id, Path)
        # Tools
        @("PSFzf", "PSFzf", "PSFzf"),
        @("Posh Git", "posh-git", "posh-git -Scope CurrentUser"),
        @("Terminal Icons", "Terminal-Icons", "Terminal-Icons -Repository PSGallery"),
        @("PSReadline", "PSReadLine", "PSReadLine -AllowPrereleas"),
        @("Z", "z", "z")
    )

    gitDotfileList = @( # (Name, Repo, Path)
        # Dot Setup
        @("PowerShell", "https://github.com/AndreM222/PowerShell.git", "Documents"),
        @("nvim", "https://github.com/AndreM222/nvim.git", "AppData\Local")
    )

    scriptDotfileList = @( # (Path, File)
        # Dot Setup
        @("AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState", "settings.json"),
        @(".", ".gitconfig")
    )
}
