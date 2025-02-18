#$variable1 = "Hello World"
#$variable2 = 42
#$variable3 = $true

#Write-Output $variable1
#Write-Output "The ansewer to everything in the universe is $variable2"
#Write-Output $variable3

# Look in to if active directory is already installed.
$ActiveDirectoryInstall = (Get-WindowsFeature -Name AD-Domain_services).installed

# Looks for a domain in case Active directory is already installed.
$ActiveDirectoryDomain = (Get-WmiObject -Class Win32_ComputerSystem).Domain

# Checks ActiveDirectoryInstall variable for true or false then either installs it or skips this part.
if ($ActiveDirectoryInstall)
    {
        Write-Output "Active Directory is already installed"

        # Looks for a domain in case Active directory is already installed.
        $ActiveDirectoryDomain = (Get-WmiObject -Class Win32_ComputerSystem).Domain

        switch ($ActiveDirectoryDomain)
        {
            {$_ -ne $null -and $_ -ne "" }
            {
                
            }

            # If there is no domain installed, it runs this code block to install it
            default
            {
                Write-Output "There is no Domain installed."
                Write-Output "Importing ADDS module."

                # Imports the ADDS module to be able to install it later.
                Import-Module ADDSDeployment
                Write-Output "Module deployed."

                # Asks for a domain name.
                $DomainName = Read-Host "Enter a Domain name (e.g. example.com):"
                
                # Asks for a Domain Admin password
                $DomainAdminPasswd = Read-Host "Enter a Password for the Domain Administrator:" -AsSecureString
                
                # Installs Active Directory Domain Controller (ADDC) with domain name and password promted for earlier.
                Write-Output "Installing Domain controler."
                Install-ADDSDomainController´
                    -DomainName $DomainName´
                    -DomainNetbiosName ($DomainName.split('.')[0])´
                    -InstallDNS´
                    -SafeModeAdministratorPassword $DomainAdminPasswd´
                    -force

                # Prompts the user to inform them that the server is getting restarted to finish the setup of Domain Controller and to re-run script to assign users to Active Directory.
                Write-Output "Restarting computer to finish Active Directory setup."
                Write-Output "Please run script again after reboot to assign users to Actiev Directory."
                Read-Host "Press Enter to continue"
                
                # Restarts the server
                Restart-Computer -Force
            }
        }
    }
else
    {
        Write-Output "Installing Active Directory"
        Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
        Write-Output "Active directory have now been installed"
    }