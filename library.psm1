function section($type)
{
    $type = $(if($type.IndexOf(' ') -ge 1) # Set type for title
        {
            $type.Substring(0, $type.IndexOf(' ')) # If has a space than cut and return beginning
        } else
        {
            $type # If no space then set type as is
        })
    Write-Host ""
    Write-Host "⌂ $type Setup" -ForegroundColor Cyan
    Write-Host " " ('-' * ($type.Length + 6)) -ForegroundColor Cyan # Set underline based on type length
}

function errorCheck($code, $title, $count)
{
    if($count -eq 2 || $count -eq 3)
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

function warnMSG($title)
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

function installerExe($manager, $list) # Check with exe
{
    section $manager # Set section title
    foreach($curr in $list)
    {
        $count = 0
        while(errorCheck 50 $curr[0] $count) # Check for errors
        {
            try
            {
                $curr[1] | Out-Null # Check if installed
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

function installerSearch($finder, $manager, $list) # Check with list
{
    section $manager # Set section title
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

function gitChecker($currPos, $repoPos)
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

function gitRepoSetup($list) # Setup From Git Repos
{
    section "Git-Dotfiles" # Set section title
    $pos = Get-Location # Get current location
    foreach($curr in $list)
    {
        $curr[2] = $(if(Test-Path -Path "$HOME\OneDrive\$($curr[2])\") # Check if in OneDrive
            {
                "$HOME\OneDrive\$($curr[2])" # Change path to onedrive
            } else
            {
                "$HOME\$($curr[2])" # Set normal path
            })

        $userResponse = $true

        if(gitChecker $pos "$($curr[2])\$($curr[0])\") # If git repo does not exist than ask user if they want to install
        {
            $userResponse = warnMSG "$($curr[0])"
            $count = 0

            if($userResponse) # If user response is yes than install
            {
                while(gitChecker $pos "$($curr[2])\$($curr[0])\" && errorCheck 70 curr[0] $count)
                {
                    git clone $curr[1] $tmpGitDotfile # Clone git repo
                    Move-Item -r -force tmpGitDotfile\* "$($curr[2])\$($curr[0])" # Move git repo to designated location
                    Remove-Item -r -force tmpGitDotfile # Remove temp git repo

                    $count++
                }

            }
        }

        if($userResponse)
        {
            Write-Host "৹ Setup $($curr[0]) Completed [✓]" -ForegroundColor Green # If user response is yes than print completed
        }
    }

}

function scriptChecker($currScript, $destinedScript)
{
    if((Get-FileHash $currScript).Hash -ne (Get-FileHash $destinedScript).Hash)
    {
        return $true # If script does not exist than continue setup
    }

    return $false # If script exists than skip setup
}

function scriptSetup($list)
{
    section "Script-Dotfiles" # Set section title
    foreach($curr in $list)
    {
        $userResponse = $true
        if(scriptChecker ".\TerminalConfig\$($curr[1])" "$HOME\$($curr[0])\$($curr[1])")
        {
            $userResponse = warnMSG $curr[1] # Check if user wants to continue
            if($userResponse)
            {
                $count = 0
                while(scriptChecker ".\TerminalConfig\$($curr[1])" "$HOME\$($curr[0])\$($curr[1])" && errorCheck 80 $curr[1] $count)
                {
                    Copy-Item -force ".\TerminalConfig\$($curr[1])" "$HOME\$($curr[0])" # Copy file to designated location
                    $count++
                }
            }
        }

        if($userResponse)
        {
            Write-Host "৹ Setup $($curr[1]) Completed [✓]" -ForegroundColor Green # If user response is yes than print completed
        }
    }
}

Export-ModuleMember -Function scriptSetup, installerSearch, installerExe, gitRepoSetup
