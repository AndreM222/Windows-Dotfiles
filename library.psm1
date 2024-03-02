#region Notifications
function section($type)
{
    Write-Host ""
    Write-Host "⌂ $type Setup" -ForegroundColor Cyan
    Write-Host " " ('-' * ($type.Length + 6)) -ForegroundColor Cyan # Set underline based on type length
}

function warnMSG($title) # <- Return true if user wants to proceed
{
    Write-Host "[WARNING!: This might replace any setup you had] " -NoNewline -InformationAction $InformationPreference -ForegroundColor Yellow
    Write-Host "Are you sure you want to use my " -NoNewLine
    Write-Host "$title" -NoNewLine  -ForegroundColor Cyan
    Write-Host " setup? [Y] Yes [N] No (Default is Y): " -NoNewline

    $answer = ""

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
function errorCheck($code, $title, $count) # <- Return true if max tries reached
{
    if($count -ge 2 -and $count -lt 4)
    {
        Write-Host "Setup Failed [$count/3], Trying again ..." -ForegroundColor DarkRed # If counter 2 or 3 than print counter
    }
    if($count -eq 4)
    {
        Write-Host "Setup Failed [X]" -ForegroundColor DarkRed
        Write-Host "৹ Error[$code]: $title" -ForegroundColor DarkRed
        return $false # If counter 4 than return false and print failed error
    }

    return $true
}

function gitChecker($currPos, $repoPos) # <- Returns true if (git) files are different
{
    Set-Location $repoPos # Set location to git repo

    $gitCheck = git config --get remote.origin.url # Check if git repo exists

    Set-Location $currPos # Set location back to original

    if($gitCheck -ne $curr[1]) # If git repo does not exist than continue setup
    {
        return $true
    }

    return $false
}

function scriptChecker($currScript, $destinedScript) # <- Returns true if not equal
{
    if((Get-FileHash $currScript).Hash -ne (Get-FileHash $destinedScript).Hash)
    {
        return $true # If script does not exist than continue setup
    }

    return $false # If script exists than skip setup
}

function onedriveChecker($destinedScript) # <- Return formatted directory
{
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
function installerExe($manager, $list) # Check with exe
{
    foreach($curr in $list)
    {
        $count = 0
        while(errorCheck 50 $curr[0] $count) # Check for errors
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

function installerCommand($manager, $list) # Check with command
{
    foreach($curr in $list)
    {
        $count = 0

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


function installerSearch($finder, $manager, $list) # Check with list
{
    foreach ($curr in $list)
    {
        $count = 0
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
function gitRepoSetup($list) # Setup From Git Repos
{
    $pos = Get-Location # Get current location
    foreach($curr in $list)
    {
        $curr[2] = onedriveChecker $curr[2]
        $userResponse = $true
        $count = 0

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

function scriptSetup($list)
{
    foreach($curr in $list)
    {
        $curr[0] = onedriveChecker $curr[0]
        $userResponse = $true
        $count = 0

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

function createSetup($list)
{
    foreach($curr in $list)
    {
        $count = 0
        $curr[2] = onedriveChecker $curr[2]

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
