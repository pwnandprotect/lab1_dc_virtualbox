function Invoke-ForestDeploy {
	Param(
	[Parameter(Mandatory=$True)]
	[ValidateNotNullOrEmpty()]
	[System.String]
	$DomainName
)
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

$DomainNetBiosName = $DomainName.split('.')[0]
$Secure_String_Pwd = ConvertTo-SecureString "P@ssW0rD!" -AsPlainText -Force
# Install-ADDSForest -DomainName $DomainName -DomainNetBiosName $DomainNetBiosName -InstallDNS:$true -SafeModeAdministratorPassword $Secure_String_Pwd -NoRebootOnCompletion -Force
Install-ADDSForest -DomainName $DomainName -DomainNetBiosName $DomainNetBiosName -InstallDNS:$true -SafeModeAdministratorPassword $Secure_String_Pwd -NoRebootOnCompletion -Force:$true
}

Invoke-ForestDeploy -DomainName pwnandprotect.local 
