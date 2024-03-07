[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUserDeclaredVarsMoreThanAssignments', '', Scope='Function')] # <- Ignore Undeclared list variable
[Object] $manager = @{
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
    WINGET = @{
        INSTALL_TYPE = "Search"
        MANAGER_INSTALLER = "Winget Install"
        MANAGER_UNINSTALLER = "Winget Uninstall"
        FINDER = "Winget List --id"
    }
    
    NVM = @{
        INSTALL_TYPE = "Executable"
        MANAGER_INSTALLER = "NVM Install"
        MANAGER_UNINSTALLER = "NVM Uninstall"
    }

    SCOOP_MANAGER = @{
        INSTALL_TYPE = "Command"
        MANAGER_INSTALLER = "Invoke-RestMethod"
        MANAGER_UNINSTALLER = "scoop uninstall scoop"
    }

    # Tools Installations
    
    NPM = @{
        INSTALL_TYPE = "Search"
        MANAGER_INSTALLER = "npm install -g"
        MANAGER_UNINSTALLER = "npm uninstall -g"
        FINDER = "npm list -g"
    }
    
    DOTNET = @{
        INSTALL_TYPE = "Search"
        MANAGER_INSTALLER = "dotnet tool install -g"
        MANAGER_UNINSTALLER = "dotnet tool uninstall -g"
        FINDER = "dotnet tool list -g"
    }

    PIP = @{
        INSTALL_TYPE = "Search"
        MANAGER_INSTALLER = "Pip Install"
        MANAGER_UNINSTALLER = "Pip Uninstall"
        FINDER = "Pip show"
    }
    
    SCOOP = @{
        INSTALL_TYPE = "Search"
        MANAGER_INSTALLER = "Scoop Install"
        MANAGER_UNINSTALLER = "Scoop Uninstall"
        FINDER = "Scoop List"
    }
    
    POWERSHELL = @{
        INSTALL_TYPE = "Search"
        MANAGER_INSTALLER = "Install-Module -Force"
        MANAGER_UNINSTALLER = "Uninstall-Module -Force"
        FINDER = "Get-Module -ListAvailable"
    }
    
    # Dotfiles Setup
    GIT = @{
        INSTALL_TYPE = "Git"
    }
    
    SCRIPT = @{
        INSTALL_TYPE = "Script"
    }

    CREATE = @{
        INSTALL_TYPE = "Create"
    }
}

Export-ModuleMember -Variable manager
