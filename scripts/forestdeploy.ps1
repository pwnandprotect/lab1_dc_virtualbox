function Write-Good { param( $String ) Write-Host $Global:InfoLine $String $Global:InfoLine1 -ForegroundColor 'Green' }
function Write-Info { param( $String ) Write-Host $String -ForegroundColor 'Gray'}
$Global:Spacing = "`t"
$Global:PlusLine = "`t[+]"
$Global:InfoLine = "`t[*]"
$Global:InfoLine1 = "[*]"


function addsInstall {
Write-Good "Installing Windows AD Domain Services Toolset."
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Write-Info "`n`nToolset installed.`n`n"
}

function forestDeploy {
Write-Good "Generating the domain. Make note of the domain name for the ADGenerator Script to be ran after the controller is built."
$DomainNetBiosName = $DomainName.split('.')[0]
Install-ADDSForest -DomainName $DomainName -DomainNetBiosName $DomainNetBiosName -InstallDNS:$true
Write-Info "`n`nRestart the controller if not instructed."
}

function Invoke-ForestDeploy {
	Param(
	[Parameter(Mandatory=$True)]
	[ValidateNotNullOrEmpty()]
	[System.String]
	$DomainName
)
addsInstall
forestDeploy
}

Invoke-ForestDeploy -DomainName pwnandprotect.local