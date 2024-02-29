function section($type)
{
    $type = $(if($type.IndexOf(' ') -ge 1)
        {
            $type.Substring(0, $type.IndexOf(' '))
        } else
        {
            $type
        })
    Write-Host ""
    Write-Host "⌂ $type Setup" -ForegroundColor Cyan
    Write-Host " " ('-' * ($type.Length + 6)) -ForegroundColor Cyan
}

function errorCheck($code, $title, $count)
{
    if($count -eq 2 || $count -eq 3)
    {
        Write-Host "Setup Failed [$count/3], Trying again ..." -ForegroundColor DarkRed
    }
    if($count -eq 4)
    {
        Write-Host "Setup Failed [X]" -ForegroundColor DarkRed
        Write-Host "৹ Error[$code]: $title" -ForegroundColor DarkRed
        return $false
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
        $answer = (Read-Host).ToUpper()
    } while(@("", "N", "NO", "Y", "YE", "YES") -notcontains $answer)
    
    if($answer[0] -eq "N") 
    {
        Write-Host "৹ Setup Canceled [C]" -ForegroundColor red
        return $false
    }
    Write-Host "Setting Up $title ..."
    return $true
}

function installerExe($manager, $list) # Check with exe
{
    section $manager
    foreach($curr in $list)
    {
        $count = 0
        while(errorCheck 50 $curr[0] $count)
        {
            try
            {
                $curr[1] | Out-Null
                Write-Host "৹ $($curr[0]) Is Installed [✓]" -ForegroundColor Green
                break
            } catch [System.Management.Automation.CommandNotFoundException]
            {
                Write-Host "Installing $($curr[0]) ..."
                Invoke-Expression "$manager $($curr[2])"
            }

            $count++
        }
    }
}

function installerSearch($finder, $manager, $list) # Check with list
{
    section $manager
    foreach ($curr in $list)
    {
        $count = 0
        while(errorCheck 60 $curr[0] $count)
        {
            $table = Invoke-Expression "$finder $($curr[1])"
            if($table -match $curr[1])
            {
                Write-Host "৹ $($curr[0]) Is Installed [✓]" -ForegroundColor Green
                break
            } else
            {
                Write-Host "Installing $($curr[0]) ..."
                Invoke-Expression "$manager $($curr[2])"
            }

            $count++
        }
    }
}

function gitRepoSetup($list) # Setup From Git Repos
{
    section "Git-Dotfiles"
    $pos = Get-Location
    foreach($curr in $list)
    {
        $curr[2] = $(if(Test-Path -Path "$HOME\OneDrive\$($curr[2])\") # Check if in OneDrive
            {
                "$HOME\OneDrive\$($curr[2])" # Change path to onedrive
            } else
            {
                "$HOME\$($curr[2])" # Set normal path
            })

        Set-Location "$($curr[2])\$($curr[0])\"

        $gitCheck = git config --get remote.origin.url
        $userResponse = $true

        Set-Location $pos

        if($gitCheck -ne $curr[1])
        {
            $userResponse = warnMSG "$($curr[0])"

            if($userResponse)
            {
                $count = 0
                while(errorCheck 70 curr[0] $count)
                {
                    if(git clone $curr[1] $tmpGitDotfile)
                    {
                        Move-Item -r -force tmpGitDotfile\* "$($curr[2])\$($curr[0])"
                        Remove-Item -r -force tmpGitDotfile
                        break
                    }

                    $count++
                }
            }
        }

        if($userResponse)
        {
            Write-Host "৹ Setup $($curr[0]) Completed [✓]" -ForegroundColor Green
        }
    }

}

function scriptSetup($list)
{
    section "Script-Dotfiles"
    foreach($curr in $list)
    {
        $userResponse = warnMSG $curr[1]
        if($userResponse)
        {
            Copy-Item -force ".\TerminalConfig\$($curr[1])" "$HOME\$($curr[0])"
        }

        if($userResponse)
        {
            Write-Host "৹ Setup $($curr[1]) Completed [✓]" -ForegroundColor Green
        }
    }
}
