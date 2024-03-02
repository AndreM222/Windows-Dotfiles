#region Notifications
function section
{
    Param( [Parameter(Mandatory=$true)][String] $title )

    Write-Host ""
    Write-Host "⌂ $title Setup" -ForegroundColor Cyan
    Write-Host " " ('-' * ($title.Length + 6)) -ForegroundColor Cyan # Set underline based on type length
}

function warnMSG # <- Return true if user wants to proceed
{
    [OutputType([Boolean])]
    Param( [Parameter(Mandatory=$true)][String] $title )

    Write-Host "[WARNING!: This might replace any setup you had] " -NoNewline -InformationAction $InformationPreference -ForegroundColor Yellow
    Write-Host "Are you sure you want to use my " -NoNewLine
    Write-Host "$title" -NoNewLine  -ForegroundColor Cyan
    Write-Host " setup? [Y] Yes [N] No (Default is Y): " -NoNewline

    [String] $answer = ""

    do
    {
        $answer = (Read-Host).ToUpper() # Get user response
    } while(@("", "N", "NO", "Y", "YE", "YES") -notcontains $answer)
    
    if($answer[0] -eq "N") # If user response is no than return false
    {
        Write-Host "৹ Setup Canceled [C]" -ForegroundColor red
        return $false
    }
    Write-Host "Setting Up $title ..."
    return $true # If user response is yes than return true and start setup
}
#endregion Notifications

#region Checkers
function errorCheck # <- Return true if max tries reached
{
    [OutputType([Boolean])]
    Param(
        [Parameter(Mandatory=$true)][UInt16] $code, 
        [Parameter(Mandatory=$true)][String] $message, 
        [Parameter(Mandatory=$true)][UInt16] $count
    )

    if($count -ge 2 -and $count -lt 4)
    {
        Write-Host "Setup Failed [$count/3], Trying again ..." -ForegroundColor DarkRed # If counter 2 or 3 than print counter
    }
    if($count -eq 4)
    {
        Write-Host "Setup Failed [X]" -ForegroundColor DarkRed
        Write-Host "৹ Error[$code]: $message" -ForegroundColor DarkRed
        return $false # If counter 4 than return false and print failed error
    }

    return $true
}

function managerCheck # <- Returns true if (manager) exists
{
    [OutputType([Boolean])]
    param(
        [Parameter(Mandatory=$true)][UINT16] $code,
        [Parameter(Mandatory=$true)][String] $manager
    )

    $manager = $(if($manager.IndexOf(' ') -ge 1) # Set manager
        {
            $manager.Substring(0, $manager.IndexOf(' ')) # If has a space than cut and return beginning
        } else
        {
            $manager # If no space then set manager as is
        })

    [UInt16] $count = 0

    while(errorCheck 40 "$manager not found" $count)
    {
        if(Get-Command $manager -ErrorAction SilentlyContinue) # Check if manager exists
        {
            return $true
        }

        $count++
    }

    return $false # If manager does not exist than return false
}

function gitChecker # <- Returns true if (git) files are different
{
    [OutputType([Boolean])]
    Param(
        [Parameter(Mandatory=$true)][String] $currPos,
        [Parameter(Mandatory=$true)][String] $repoPos
    )

    Set-Location $repoPos # Set location to git repo

    $gitCheck = git config --get remote.origin.url # Check if git repo exists

    Set-Location $currPos # Set location back to original

    if($gitCheck -ne $curr[1]) # If git repo does not exist than continue setup
    {
        return $true
    }

    return $false
}

function scriptChecker # <- Returns true if not equal
{
    [OutputType([Boolean])]
    Param(
        [Parameter(Mandatory=$true)][String] $currScript,
        [Parameter(Mandatory=$true)][String] $destinedScript
    )

    if((Get-FileHash $currScript).Hash -ne (Get-FileHash $destinedScript).Hash)
    {
        return $true # If script does not exist than continue setup
    }

    return $false # If script exists than skip setup
}

function onedriveChecker # <- Return formatted directory
{
    [OutputType([String])]
    Param( [Parameter(Mandatory=$true)][String] $destinedScript )

    if(@(".", "~") -contains $destinedScript)
    {
        return "$env:USERPROFILE" # <- Return (Home) directory
    } elseif((Test-Path -Path "$env:USERPROFILE\OneDrive\$destinedScript"))
    {
        return "$env:USERPROFILE\OneDrive\$destinedScript" # <- Return formatted (Default with OneDrive) directory
    }

    return "$env:USERPROFILE\$destinedScript" # <- Return fromatted (Default with Home) directory
}
#endregion Checkers

#region Installers
function installerExe # Check with exe
{
    Param(
        [Parameter(Mandatory=$true)][String] $manager,
        [Parameter(Mandatory=$true)][Object] $list
    )

    if(!(managerCheck 40 $manager)) # Check if manager exists
    {
        return
    }

    foreach($curr in $list)
    {
        [UInt16] $count = 0
        while(errorCheck 40 $curr[0] $count) # Check for errors
        {
            try
            {
                Invoke-Expression $curr[1] | Out-Null # Check if installed
                Write-Host "৹ $($curr[0]) Is Installed [✓]" -ForegroundColor Green # If installed than print
                break
            } catch [System.Management.Automation.CommandNotFoundException]
            {
                Write-Host "Installing $($curr[0]) ..."
                Invoke-Expression "$manager $($curr[2])" # If not installed than install
            }

            $count++
        }
    }
}

function installerCommand # Check with command
{
    Param(
        [Parameter(Mandatory=$true)][String] $manager,
        [Parameter(Mandatory=$true)][Object] $list
    )

    if(!(managerCheck 50 $manager)) # Check if manager exists
    {
        return
    }

    foreach($curr in $list)
    {
        [UInt16] $count = 0

        while(errorCheck 50 $curr[0] $count) # Check for errors
        {
            if([Boolean](Get-Command $curr[0] -ErrorAction SilentlyContinue))
            {
                Write-Host "৹ $($curr[0]) Is Installed [✓]" -ForegroundColor Green # If installed than print
                break
            } else      
            {
                Write-Host "Installing $($curr[0]) ..."
                Invoke-Expression "$manager $($curr[2])" # If not installed than install
            }

            $count++
        }
    }
}


function installerSearch # Check with list
{
    Param(
        [Parameter(Mandatory=$true)][String] $finder,
        [Parameter(Mandatory=$true)][String] $manager,
        [Parameter(Mandatory=$true)][Object] $list
    )

    if(!(managerCheck 60 $manager)) # Check if manager exists
    {
        return
    }

    foreach ($curr in $list)
    {
        [UInt16] $count = 0
        while(errorCheck 60 $curr[0] $count) # Check for errors
        {
            $table = Invoke-Expression "$finder $($curr[1])" # Check if installed

            if($table -match $curr[1])
            {
                Write-Host "৹ $($curr[0]) Is Installed [✓]" -ForegroundColor Green # If installed than print
                break
            } else
            {
                Write-Host "Installing $($curr[0]) ..."
                Invoke-Expression "$manager $($curr[2])" # If not installed than install
            }

            $count++
        }
    }
}
#endregion Installers

#region Setups
function gitRepoSetup # Setup From Git Repos
{
    Param( [Parameter(Mandatory=$true)][Object] $list )

    if(!(managerCheck 70 "git")) # Check if manager exists
    {
        return
    }

    $pos = Get-Location # Get current location
    foreach($curr in $list)
    {
        $curr[2] = onedriveChecker $curr[2]

        [Boolean] $userResponse = $true
        [UInt16] $count = 0

        if(gitChecker $pos "$($curr[2])\$($curr[0])\") # If git repo does not exist than ask user if they want to install
        {
            $userResponse = warnMSG "$($curr[0])"

            if($userResponse) # If user response is yes than install
            {
                while(gitChecker $pos "$($curr[2])\$($curr[0])\" -and errorCheck 70 curr[0] $count)
                {
                    git clone $curr[1] $tmpGitDotfile # Clone git repo
                    Move-Item -r -force tmpGitDotfile\* "$($curr[2])\$($curr[0])" # Move git repo to designated location
                    Remove-Item -r -force tmpGitDotfile # Remove temp git repo

                    $count++
                }

            }
        }

        if($userResponse -and $count -lt 4)
        {
            Write-Host "৹ Setup $($curr[0]) Completed [✓]" -ForegroundColor Green # If user response is yes than print completed
        }
    }

}

function scriptSetup
{
    Param( [Parameter(Mandatory=$true)][Object] $list )

    foreach($curr in $list)
    {
        $curr[0] = onedriveChecker $curr[0]

        [Boolean] $userResponse = $true
        [UInt16] $count = 0

        if(scriptChecker ".\TerminalConfig\$($curr[1])" "$($curr[0])\$($curr[1])")
        {
            $userResponse = warnMSG $curr[1] # Check if user wants to continue
            if($userResponse)
            {
                while(scriptChecker ".\TerminalConfig\$($curr[1])" "$($curr[0])\$($curr[1])" -and errorCheck 80 $curr[1] $count)
                {
                    Copy-Item -force ".\TerminalConfig\$($curr[1])" "$($curr[0])" # Copy file to designated location
                    $count++
                }
            }
        }

        if($userResponse -and $count -lt 4)
        {
            Write-Host "৹ Setup $($curr[1]) Completed [✓]" -ForegroundColor Green # If user response is yes than print completed
        }
    }
}

function createSetup
{
    Param( [Parameter(Mandatory=$true)][Object] $list )

    foreach($curr in $list)
    {
        $curr[2] = onedriveChecker $curr[2]

        [UInt16] $count = 0

        while(errorCheck 90 $curr[0] $count)
        {
            if(Test-Path -Path "$($curr[2])\$($curr[0])")
            {
                Write-Host "৹ Setup $($curr[0]) Completed [✓]" -ForegroundColor Green # If user response is yes than print completed
                break
            }
            Write-Output $curr[1] > "$($curr[2])\$($curr[0])" # Create directory
            $count++
        }
    }
}
#endregion Setups

Export-ModuleMember -Function scriptSetup, installerSearch, installerExe, installerCommand, gitRepoSetup, createSetup, section
