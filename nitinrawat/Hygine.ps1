$hostname1=hostname
New-Object System.Net.Sockets.TCPClient -ArgumentList "$hostname1",3389 | select-object Connected

Get-WmiObject Win32_TerminalServiceSetting -Namespace root\cimv2\TerminalServices).SetAllowTsConnections(1,1) | Out-Null
(Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\cimv2\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0) | Out-Null
Get-NetFirewallRule -DisplayName "Remote Desktop*" | Set-NetFirewallRule -enabled true

#Installing telnet-client
Install-WindowsFeature -Name telnet-client
#Installing snmp
Install-WindowsFeature -Name RSAT-SNMP

#Applying permission on file
$acl = Get-Acl C:\Users\Administrator\testfile1.txt
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Raghav","Write","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl 'C:\Users\Administrator\testfile1.txt'

#Blocking External USB access
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR\ -Name start -Value 4

#Checking memory usage in 1 mins interval
Get-Counter -Counter "\memory\available mbytes" -MaxSamples 1 -SampleInterval 60

#Checking processor after 1 min interval
$proc =get-counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 60
$cpu=($proc.readings -split ":")[-1]
$cpu $proc =get-counter -Counter "\Processor(_Total)\% Processor Time" -SampleInterval 2 
$cpu=($proc.readings -split ":")[-1]
$cpu

#Checking disk space
Get-Counter -Counter "\memory\available mbytes" -MaxSamples 1 -SampleInterval 600

