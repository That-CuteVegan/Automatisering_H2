#$variable1 = "Hello World"
#$variable2 = 42
#$variable3 = $true

#Write-Output $variable1
#Write-Output "The ansewer to everything in the universe is $variable2"
#Write-Output $variable3

# Look in to if active directory is already installed.
$ActiveDirectoryInstall = (Get-WindowsFeature -Name AD-Domain_services).installed

# Imports users for Active Directory from a csv file to be used later
$Users = Import-Csv -Path "users.csv"

# Checks ActiveDirectoryInstall variable for true or false then either installs it or skips this part.
if ($ActiveDirectoryInstall)
{
    Write-Host "Active Directory is already installed"

    # Looks for a domain in case Active directory is already installed.
    $ActiveDirectoryDomain = (Get-WmiObject -Class Win32_ComputerSystem).Domain

    switch ($ActiveDirectoryDomain)
    {
        {$_ -ne $null -and $_ -ne "" }
        {
            # Loops thru users in users.csv file to create users in Active Directory.
            foreach ($user in $Users)
            {
                $FirstName = $user.FirstName
                $LastName = $user.LastName
                $UserName = $user.Username
                $Password = ConvertTo-SecureString $user.Password -AsPlainText -Force 
                $OU = $user.OU

                # Takes the first and last name's first letters to make initials for their email.
                $FirstNameInitial = $User.Firstname.Substring(0,1)
                $LastNameInitial = $User.Lastname.Substring(0,1)
                $Initials = $FirstNameInitial + $LastNameInitial

                # Takes the initials and Domain and makes the users email address.
                $Email = "$Initials@$ActiveDirectoryDomain"

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

                # Defines user properties
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

            Write-Host "All users have been created."
        }

        # If there is no domain installed, it runs this code block to install it
        default
        {
            Write-Host "There is no Domain installed."
            Write-Host "Importing ADDS module."

            # Imports the ADDS module to be able to install it later.
            Import-Module ADDSDeployment
            Write-Host "Module deployed."

            # Asks for a domain name.
            $DomainName = Read-Host "Enter a Domain name (e.g. example.com):"
                
            # Asks for a Domain Admin password
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
                
    # Asks for a Domain Admin password
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