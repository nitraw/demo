# Add local user and group

Get-Command -Module Microsoft.PowerShell.localaccounts

Get-LocalUser

Get-LocalUser -Name ‘guest’ | Select-Object *

$UserPassword = Read-Host –AsSecureString
New-LocalUser "AAA" -Password $UserPassword -FullName "AAA BBB" -Description "CompleteVisibility"

Add-LocalGroupMember -Group Administrators -Member AAA

Get-LocalGroupMember -Group 'Group1'

Get-LocalGroup 

New-LocalGroup -Name "q"

#remove local user
Remove-LocalUser -Name "Rawat"

#ceate a new group:

New-LocalGroup -Name 'Netwrix Users' -Description 'Netwrix Users Group'

# add a user (or a group) to a local group
Add-LocalGroupMember -Group 'Group1' -Member ('Rawat') –Verbose

#members of a particular local group:

Get-LocalGroupMember -Group 'Netwrix Users'

#Removing a local group with PowerShell

Remove-LocalGroupMember -Group 'Netwrix Users' –Member 'guest'

