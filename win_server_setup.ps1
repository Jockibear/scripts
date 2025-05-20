#variablen: $hostname, $primary_dns, $secondary_dns, $domain, $ipaddress
# $local_user = Get-LocalGroupMember -Group "Administrators"
Rename-Computer -NewName $hostname
Get-NetIPInterface
set-netipaddress -interfaceindex 6 -IPAddress $ipaddress
Set-DnsClientServerAddress -InterfaceIndex 6 -ServerAddresses ($primary_dns, $secondary_dns)
Restart-Computer -Force
Add-Computer -ComputerName $hostname -LocalCredential $hostname\Administrator -DomainName $domain -Credential $domain\Administrator -Force
Enable-PSremoting -force
Restart-Computer -Force
