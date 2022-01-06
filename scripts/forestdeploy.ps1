function Write-Good { param( $String ) Write-Host $Global:InfoLine $String $Global:InfoLine1 -ForegroundColor 'Green' }
function Write-Info { param( $String ) Write-Host $String -ForegroundColor 'Gray'}
$Global:Spacing = "`t"
$Global:PlusLine = "`t[+]"
$Global:InfoLine = "`t[*]"
$Global:InfoLine1 = "[*]"

function Invoke-ForestDeploy {
	Param(
	[Parameter(Mandatory=$True)]
	[ValidateNotNullOrEmpty()]
	[System.String]
	$DomainName
)
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

Invoke-ForestDeploy -DomainName pwnandprotect.local 
$DomainNetBiosName = $DomainName.split('.')[0]
$Secure_String_Pwd = ConvertTo-SecureString "P@ssW0rD!" -AsPlainText -Force
Install-ADDSForest -DomainName $DomainName -DomainNetBiosName $DomainNetBiosName -InstallDNS:$true -SafeModeAdministratorPassword $Secure_String_Pwd -NoRebootOnCompletion -Force

}