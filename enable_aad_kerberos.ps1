# Get your domain
$domain = $env:USERDNSDOMAIN
# Enter a domain administrator username and password.
$domainCred = Get-Credential
# UserPrincipalName of an Azure AD Global Administrator
$userPrincipalName = "adm_janik@jocki01.de"
# Create the new Azure AD Kerberos Server object in Active Directory
Set-AzureADKerberosServer -Domain $domain -UserPrincipalName $userPrincipalName -DomainCredential $domainCred