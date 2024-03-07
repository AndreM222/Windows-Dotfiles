if($env:OS -notlike "*Windows*")
{ 
    Write-Host "> This script is only for Windows OS" -ForegroundColor DarkRed
    exit
}

#region Module Setup
[String] $urlGitLink = "https://raw.githubusercontent.com/AndreM222/Windows-Dotfiles/master" # Link to the git repository for modules

[Object] $modules = @("listSetup.psm1", "library.psm1", "managerSetting.psm1") # List of modules to import

if([String](Split-Path -Path (Get-Location) -Leaf) -ne "Windows-Dotfiles") # Check if the current location is not the Windows-Dotfiles folder
{
    foreach($curr in $modules)
    {
        Invoke-RestMethod "$urlGitLink/$curr" > $curr # Download the modules from the git repository
    }
}

#endregion Module Setup

#region Managers
Import-Module ".\managerSetting.psm1" # Importing the list of managers

#   Imported List:
#   - $manager <- Variable containing installation list

#endregion Managers

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

#region Module Removal
if([String](Split-Path -Path (Get-Location) -Leaf) -ne "Windows-Dotfiles")
{
    foreach($curr in $modules)
    {
        if(Test-Path -Path $curr)
        {
            Remove-Item $curr # Remove modules from current location
        }
    }
}
#endregion Module Removal

#region Setup Functions
foreach($item in $list)
{
    section $item["TITLE"] # Print the section title

    Switch($manager[$item["MANAGER"]]["INSTALL_TYPE"])
    {

        #region Executable Installer
        "Executable"
        { 
            installerExe $manager[$item["MANAGER"]]["MANAGER_INSTALLER"] $item["CONTAINER"] 
        }
        #endregion Executable Installer

        #region Executable Installer
        "Command"
        { 
            installerCommand $manager[$item["MANAGER"]]["MANAGER_INSTALLER"] $item["CONTAINER"] 
        }
        #endregion Executable Installer


        #region Search Installer
        "Search"
        { 
            installerSearch $manager[$item["MANAGER"]]["FINDER"] $manager[$item["MANAGER"]]["MANAGER_INSTALLER"] $item["CONTAINER"] 
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
