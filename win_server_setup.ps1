#variablen: $hostname, $primary_dns, $secondary_dns, $domain, $ipaddress, $admin_server
# $local_user = Get-LocalGroupMember -Group "Administrators"
Rename-Computer -NewName $hostname
Get-NetIPInterface
set-netipaddress -interfaceindex 6 -IPAddress $ipaddress
Set-DnsClientServerAddress -InterfaceIndex 6 -ServerAddresses ($primary_dns, $secondary_dns)
Restart-Computer -Force
Add-Computer -ComputerName $hostname -LocalCredential $hostname\Administrator -DomainName $domain -Credential $domain\Administrator -Force
Enable-PSremoting -Force
Set-Item wsman:\localhost\client\trustedhosts $admin_server
Install-WindowsFeature -Name RSAT-AD-Tools -IncludeManagementTools
Restart-Computer -Force
