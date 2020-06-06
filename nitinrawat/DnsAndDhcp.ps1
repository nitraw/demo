# Install domain service
  Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
  Get-ADDomain
#Install Forest for domain 
  Install-ADDSForest -DomainName “www.mydomain.com”

  get-ADComputer | Format-Table DNSHostName, Enabled, Name, SamAccountName

#Install DNS 
  Install-WindowsFeature DNS -IncludeManagementTools
  Get-WindowsFeature | where {($_.name -like “DNS”)}

#Get IP address
  Get-NetIPAddress
  Add-DnsServerPrimaryZone -NetworkID 192.168.64.0/24 -ZoneFile "18.189.152.123.in-addr.arpa.dns"
  Add-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru

#Test DNS server
  Test-DnsServer -IPAddress 18.189.152.123 -ZoneName "www.mydomain.com"
  Test-DnsServer

  nslookup

#Install HCP

  Install-WindowsFeature DHCP -IncludeManagementTools
#Create scope range for DHCP server
  Add-DHCPServerv4Scope -Name “Employee Scope” -StartRange 172.31.24.230 -EndRange 172.31.24.250 -SubnetMask 255.255.255.0 -State Active
  Set-DhcpServerv4Scope -ScopeId 192.168.64.0 -LeaseDuration 1.00:00:00
  Set-DhcpServerv4Scope -ScopeId 172.31.27.0 -LeaseDuration 1.00:00:00
  Set-DHCPServerv4OptionValue -ScopeID 172.31.27.0 -DnsDomain www.mydomain.com -DnsServer 172.31.27.230 -Router 172.31.27.1
  Add-DhcpServerInDC -DnsName www.mydomain.com -IpAddress 172.31.27.230
#Get DHCP server  
  Get-DhcpServerv4Scope
  Get-DhcpServerInDC