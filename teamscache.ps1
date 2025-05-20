Stop-Process -Name "Teams"
Remove-Item C:\Users\$env:username\AppData\Roaming\Microsoft\Teams\ -Recurse -Force
Stop-Process -Name "ms-teams"
Remove-Item C:\Users\$env:username\AppData\Local\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\ -Recurse -Force