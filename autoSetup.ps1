if($env:OS -notlike "*Windows*")
{ 
    Write-Host "> This script is only for Windows OS" -ForegroundColor DarkRed
    exit
}

$container = & .\listSetup.ps1 # Importing the list of tools for install

#region Functions
Import-Module ".\library.psm1"

# Imported Functions List:
#  - installerSearch <- (Name, Executable, Path)
#  - installerExe <- (Name, Id, Path)
#  - gitRepoSetup <- (Name, Repo, Path)
#  - scriptSetup <- (Path, File)

#endregion Functions



#region Setup Functions
foreach($item in $container)
{
    Switch($item["INSTALL_TYPE"])
    {

        #region Executable Installer
        "Executable"
        { 
            installerExe $item["MANAGER"] $item["CONTAINER"] 
        }
        #endregion Executable Installer

        #region Search Installer
        "Search"
        { 
            installerSearch $item["FINDER"] $item["MANAGER"] $item["CONTAINER"] 
        }
        #region Search Installer

        #region Git Setups
        "Git"
        { 
            gitRepoSetup $item["CONTAINER"] 
        }
        #endregion Git Dotfile Setups

        #region Script Dotfile Setup
        "Script"
        { 
            scriptSetup $item["CONTAINER"] 
        }
        #endregion Script Dotfile Setup

        #region Create Dotfile Setup
        "Create"
        { 
            createSetup $item["CONTAINER"] 
        }
        #endregion Script Dotfile Setup

    }
}
#region Setup Functions
