#$variable1 = "Hello World"
#$variable2 = 42
#$variable3 = $true

#Write-Output $variable1
#Write-Output "The ansewer to everything in the universe is $variable2"
#Write-Output $variable3

# Imports the system parameters info from user32.dll.
Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Screen { [DllImport("user32.dll")] public static extern int SystemParametersInfo(int uAction, int uParam, IntPtr lpvParam, int fuWinIni); }'

# Looks at who the current user logged in is and assigns it to a variable to beused later.
$CurrentUser = $env:USERNAME

# Look in to if active directory is already installed.
$ActiveDirectoryInstall = (Get-CimInstance -Name AD-Domain_services).installed

# Imports users for Active Directory from a csv file to be used later.
$Users = Import-Csv -Path "users.csv"

# Function to make the screen do a barrel roll.
function BarrelRoll
{
    param ([int]$Angle)

    # Simulating a Windows DEVMODE to configure display settings to be used to make screen do a barrel roll.
    $DEVMODE = New-Object -PSObject -Property @{
        dmSize = 156
        dmDriverExtra = 0
        dmFields = 0x80
        dmDisplayOriantation = $Angle
    }

    # API call to System Parameter Info to configure the screen to the angle rotation called later in the script.
    $Result = [Screen]::SystemParametersInfo(0x0020, 0, [Runtime.InteropServices.Marshal]::AllocHGlobal([System.Runtime.InteropServices.Marshal]::SizeOf($DEVMODE)), 0x02)

    if($Result -eq 0) {
        Write-Host "Rotation failed"
    }
}

# Checks ActiveDirectoryInstall variable for true or false then either installs it or skips this part.
if ($ActiveDirectoryInstall)
{
    Write-Host "Active Directory is already installed"

    # Looks for a domain in case Active directory is already installed.
    $ActiveDirectoryDomain = (Get-CimInstance -Class Win32_ComputerSystem).Domain

    switch ($ActiveDirectoryDomain)
    {
        {$_ -ne $null -and $_ -ne "" }
        {
            # Loops thru users in users.csv file to create users in Active Directory.
            foreach ($user in $Users)
            {
                try 
                {
                    # Uses Function 'BarrelRoll' to rotate the screen in a Barrelroll.
                    BarrelRoll -angle 1  # 90 degrees
                    Start-Sleep -Seconds 1
                    BarrelRoll -angle 2  # 180 degrees
                    Start-Sleep -Seconds 1
                    BarrelRoll -angle 3  # 270 degrees
                    Start-Sleep -Seconds 1
                    BarrelRoll -angle 0  # Back to normal
                    Start-Sleep -Seconds 1

                    $FirstName = $user.FirstName
                    $LastName = $user.LastName
                    $UserName = $user.Username
                    $Password = ConvertTo-SecureString $user.Password -AsPlainText -Force 
                    $OU = $user.OU
                    $RandomNumber = Get-Random
    
                    # Takes the first and last name's first letters to make initials for their email.
                    $FirstNameInitial = $User.Firstname.Substring(0,1)
                    $LastNameInitial = $User.Lastname.Substring(0,1)
                    $Initials = $FirstNameInitial + $LastNameInitial
    
                    # Takes the initials and Domain and makes the users email address.
                    $Email = "$Initials$RandomNumber@$ActiveDirectoryDomain"
    
                    # Looks in to if the OU that the users are assigned to already excist, otherwise passes them to a code block that will create them.
                    $OUExists = Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$OU'" -ErrorAction SilentlyContinue
                    Write-Host "Checking for Orginasational units and creates the missing ones."
    
                    # Takes the value from earlier and either installs the OU or passes on it if it is already there.
                    if (-not $OUExists)
                    {
                        New-ADOrganizationalUnit -Name $OU -Path $user.OU
                        Write-Host "Created OU: $OU"
                    }
    
                    else 
                    {
                        Write-Host "OU $OU already exists."
                    }
    
                    # Defines user properties.
                    $PrincipalName = $Email
    
                    # Aigns the new uers to the Active directory.
                    New-ADUser  -SamAccountName $UserName `
                        -UserPrincipalName $PrincipalName `
                        -GivenName $FirstName `
                        -Surname $LastName `
                        -Name "$FirstName $LastName" `
                        -DisplayName "$FirstName $LastName" `
                        -EmailAddress $Email `
                        -AccountPassword $Password `
                        -Enabled $true `
                        -PassThru `
                        -Path $OU `
                        -ChangePasswordAtLogon $true
    
                        Write-host "Created user: $FirstName $LastName"
                }
                catch 
                {
                    # Create time stamp for error  logging.
                    $TimeStamp = Get-Date -Format "dd-mm-yyyy HH:mm:ss"

                    # Crates error message.
                    $ErrorMessage = "[$TimeStamp] Error:$($_.Exception.Message)`n[$TimeStamp] Stack Trace: $($_.ScriptStackTrace)"


                    # Appends the error message to a txt file.
                    $ErrorMessage | Out-File -FilePath C:\Users\$currentUser\Desktop\UsersErrorLog.txt  -Append -Encoding UTF8
                    Write-Host "An Error occured, Check the log file on your desktop UsersErrorLog.txt"
                }
               
            }

            Write-Host "All users have been created."
        }

        # If there is no domain installed, it runs this code block to install it.
        default
        {
            Write-Host "There is no Domain installed."
            Write-Host "Importing ADDS module."

            # Imports the ADDS module to be able to install it later.
            Import-Module ADDSDeployment
            Write-Host "Module deployed."

            # Asks for a domain name.
            $DomainName = Read-Host "Enter a Domain name (e.g. example.com):"
                
            # Asks for a Domain Admin password.
            $DomainAdminPasswd = Read-Host "Enter a Password for the Domain Administrator:" -AsSecureString
                
            # Installs Active Directory Domain Controller (ADDC) with domain name and password promted for earlier.
            Write-Host "Installing Domain controler."
            Install-ADDSDomainController `
                -DomainName $DomainName `
                -DomainNetbiosName ($DomainName.split('.')[0]) `
                -InstallDNS `
                -SafeModeAdministratorPassword $DomainAdminPasswd `
                -force

            # Prompts the user to inform them that the server is getting restarted to finish the setup of Domain Controller and to re-run script to assign users to Active Directory.
            Write-Host "Restarting computer to finish Active Directory setup."
            Write-Host "Please run script again after reboot to assign users to Actiev Directory."
            Read-Host "Press Enter to continue"
                
            # Restarts the server
            Restart-Computer -Force
        }
    }
}
else
{
    Write-Host "Installing Active Directory"
    Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
    Write-Host "Active directory have now been installed"

    # Runs block to install a Domain on top of the Active Directory service.
    Read-Host "Press Enter to continue"
    Write-Host "There is no Domain installed."
    Write-Host "Importing ADDS module."

    # Imports the ADDS module to be able to install it later.
    Import-Module ADDSDeployment
    Write-Host "Module deployed."

    # Asks for a domain name.
    $DomainName = Read-Host "Enter a Domain name (e.g. example.com):"
                
    # Asks for a Domain Admin password.
    $DomainAdminPasswd = Read-Host "Enter a Password for the Domain Administrator:" -AsSecureString
                
    # Installs Active Directory Domain Controller (ADDC) with domain name and password promted for earlier.
    Write-Host "Installing Domain controler."
    Install-ADDSDomainController `
        -DomainName $DomainName `
        -DomainNetbiosName ($DomainName.split('.')[0]) `
        -InstallDNS `
        -SafeModeAdministratorPassword $DomainAdminPasswd `
        -force

    # Prompts the user to inform them that the server is getting restarted to finish the setup of Domain Controller and to re-run script to assign users to Active Directory.
    Write-Host "Restarting computer to finish Active Directory setup."
    Write-Host "Please run script again after reboot to assign users to Actiev Directory."
    Read-Host "Press Enter to continue"
                
    # Restarts the server.
    Restart-Computer -Force
}