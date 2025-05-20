#connect to MsGraph with App Credentials for Risk API
$ClientSecretCredential = Get-Credential -Credential "d7df3ec0-d2dc-47cc-b564-5e3f1532904b"
Connect-MgGraph -TenantId "fc189550-fbeb-4aff-8d93-09f4a31c02ad" -SecretCredential $ClientSecretCredential
Get-MgRiskyUser
Get-MgRiskDetection

#connect to MsGraph to review access package assignments
Connect-MgGraph -Scopes "EntitlementManagement.Read.All"
Select-MgProfile -Name "beta"
$accesspackage = Get-MgEntitlementManagementAccessPackage -DisplayNameEq "Marketing Campaign"
$assignments = Get-MgEntitlementManagementAccessPackageAssignment -AccessPackageId $accesspackage.Id -ExpandProperty target -All -ErrorAction Stop
$assignments | ft Id,AssignmentState,TargetId,{$_.Target.DisplayName}