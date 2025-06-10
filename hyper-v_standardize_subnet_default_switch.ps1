Get-NetIPAddress -InterfaceIndex (Get-NetAdapter -Name 'vEthernet (Default Switch)').ifIndex | Remove-NetIPAddress -confirm:$false
New-NetIPAddress -InterfaceAlias 'vEthernet (Default Switch)' -IPAddress '172.30.176.1' -PrefixLength 24
