$variable1 = "Hello World"
$variable2 = 42
$variable3 = $true

Write-Output $variable1
Write-Output "The ansewer to everything in the universe is $variable2"
Write-Output $variable3

# Look in to if active directory is already installed
$ActiveDirectoryInstall = (Get-WindowsFeature -Name AD-Domain_services).installed

# Checks ActiveDirectoryInstall variable for true or false then either installs it or skips this part
if ($ActiveDirectoryInstall)
    {
        Write-Output "Active Directory is already installed"
    }
else
    {
        Write-Output "Installing Active Directory"
        Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
        Write-Output "Active directory have now been installed"
    }