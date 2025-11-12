$ParisUsers = Get-ADUser -Filter 'City -like "Paris"'

foreach ($user in $ParisUsers) {
    Set-ADUser -identity $user.DistinguishedName -ChangePasswordAtLogon $true
    Move-ADObject -identity $user.DistinguishedName -TargetPath "OU=Paris,DC=contoso,DC=com"
    Disable-ADAccount -identity $user.samaccountname
}