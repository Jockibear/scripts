$clientId = Read-Host "Enter Client/App ID"
$clientSecret = Read-Host "Enter Client Secret" -AsSecureString
$tenantId = "fc189550-fbeb-4aff-8d93-09f4a31c02ad"

$clientSecretPlainText = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($clientSecret))

$auth_url = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token"
$risk_api = "https://riskdetectionapimsgraph-1nwndt.msappproxy.net/v1.0/identityProtection/riskyUsers"

$body = @{
    client_id     = $clientId
    scope         = "https://graph.microsoft.com/.default"
    client_secret = $clientSecretPlainText
    grant_type    = "client_credentials"
}

$response = Invoke-RestMethod -Uri $auth_url -Method Post -Body $body

Write-Output $response.access_token

Write-Output $(Invoke-RestMethod -uri $risk_api -Headers @{Authorization = "Bearer $($response.access_token)"})