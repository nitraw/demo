#list all disk
get-Disk

#clear 
#get disk not system disk
get-Disk | Where-Object IsSystem -EQ $False

#get disk that are offline
get-Disk | Where-Object IsOffline -EQ $True

Clear-Disk -Number 0 -RemoveData

Get-Partition

New-Partition –DiskNumber 0 -AssignDriveLetter –UseMaximumSize

#Initialize-Disk -Number 1

New-Partition –DiskNumber 0 -Size 1gb -DriveLetter h

Get-Partition –DiskNumber 0

# List all volumes
Get-Volume
 
# Format volumes with NTFS
Format-Volume -DriveLetter H -FileSystem NTFS -Confirm:$false

# Delete a partition
Get-Partition -DriveLetter D | Remove-Partition -Confirm:$false

