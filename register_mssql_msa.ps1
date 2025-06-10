Test-KdsRootKey -KeyID (Get-KdsRootKey).KeyId
# if it fails -> Add-KdsRootKey -EffectiveImmediately 
New-ADServiceAccount -Name sql_msa01 -Enabled $true -Description "Managed Service Account for SQL Server SCCM" -DisplayName "MSA 01 - SCCM_SQL" -RestrictToSingleComputer
New-PSSession -ComputerName SCCM
Enter-PSSession -Id 1s
Install-WindowsFeature RSAT-AD-Powershell
Install-ADServiceAccount -identity sql_msa01
Test-ADServiceAccount -identity sql_msa01