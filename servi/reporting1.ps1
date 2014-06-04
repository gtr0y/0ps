cls
$pw = convertto-securestring -AsPlainText -Force -String "cegth67VTUF"
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist "servi7\Administrador",$pw
#$cred = Get-Credential
$wsman = new-pssession -computername "servi7" -authentication default -credential $cred
#enter-pssession -session $wsman
Invoke-Command -Session $wsman {
$hostname = hostname
$DiskInfo= Get-WMIObject -ComputerName $hostname Win32_LogicalDisk | Where-Object{$_.DriveType -eq 3} | Select-Object SystemName, DriveType, VolumeName, Name, @{n='Size (GB)';e={"{0:n2}" -f ($_.size/1gb)}}, @{n='FreeSpace (GB)';e={"{0:n2}" -f ($_.freespace/1gb)}}, @{n='PercentFree';e={"{0:n2}" -f ($_.freespace/$_.size*100)}}
$DiskInfo
}
#exit-pssession
remove-pssession -session $wsman

$DiskInfo= Get-WMIObject -ComputerName $computer Win32_LogicalDisk | Where-Object{$_.DriveType -eq 3} | Where-Object{ ($_.freespace/$_.Size)*100 -lt $thresholdspace} `
       | Select-Object SystemName, DriveType, VolumeName, Name, @{n='Size (GB)';e={"{0:n2}" -f ($_.size/1gb)}}, @{n='FreeSpace (GB)';e={"{0:n2}" -f ($_.freespace/1gb)}}, @{n='PercentFree';e={"{0:n2}" -f ($_.freespace/$_.size*100)}}
       
       estreP2·
       estreP2#
       baofeng2323
      "·"