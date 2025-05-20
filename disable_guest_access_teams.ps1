$GroupName = "<GroupName>"

Connect-AzureAD

$template = Get-AzureADDirectorySettingTemplate | ? {$_.displayname -eq "group.unified.guest"}
$settingsCopy = $template.CreateDirectorySetting()
$settingsCopy["AllowToAddGuests"]=$False
$groupID= (Get-AzureADGroup -SearchString $GroupName).ObjectId
New-AzureADObjectSetting -TargetType Groups -TargetObjectId $groupID -DirectorySetting $settingsCopy
Get-AzureADObjectSetting -TargetObjectId $groupID -TargetType Groups | fl Values


#globally disable guest accounts in teams(their logon)
#Set-CsTeamsClientConfiguration -AllowGuestUser $True -Identity Global