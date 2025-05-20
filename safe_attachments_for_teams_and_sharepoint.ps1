Connect-ExchangeOnline
#include sharepoint and teams within safe-attachments
Set-AtpPolicyForO365 -EnableATPForSPOTeamsODB $true
#disable download/view of potentially malicious files
Set-SPOTenant -DisallowInfectedFileDownload $true
