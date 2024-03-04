if($env:OS -notlike "*Windows*")
{ 
    Write-Host "> This script is only for Windows OS" -ForegroundColor DarkRed
    exit
}

#region Module Setup
[String] $urlGitLink = "https://raw.githubusercontent.com/AndreM222/Windows-Dotfiles/master" # Link to the git repository for modules

[Object] $modules = @("listSetup.psm1", "library.psm1") # List of modules to import

foreach($curr in $modules)
{
    Invoke-RestMethod "$urlGitLink/$curr" > $curr
}

#endregion Module Setup

#region Variables
Import-Module ".\listSetup.psm1" # Importing the list of tools for install

# Imported List:
#   - $list <- Variable containing installation list

#endregion Variables

#region Functions
Import-Module ".\library.psm1"

# Imported Functions List:
#  - installerExe <- (Name, Executable, Path)
#  - installerCommand <- (Name, Executable, Path)
#  - installerSearch <- (Name, Id, Path)
#  - gitRepoSetup <- (Name, Repo, Path)
#  - scriptSetup <- (Path, File)
#  - createSetup <- (File, Content, Path)
#
#  - section <- (Title)

#endregion Functions

#region Setup Functions
foreach($item in $list)
{
    section $item["TITLE"] # Print the section title

    Switch($item["INSTALL_TYPE"])
    {

        #region Executable Installer
        "Executable"
        { 
            installerExe $item["MANAGER"] $item["CONTAINER"] 
        }
        #endregion Executable Installer

        #region Executable Installer
        "Command"
        { 
            installerCommand $item["MANAGER"] $item["CONTAINER"] 
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

#endregion Setup Functions

#region Module Removal
foreach($curr in $modules)
{
    if(Test-Path -Path $curr)
    {
        Remove-Item $curr # Remove modules from current location
    }
}
#endregion Module Removal
