#This was Designed to Fix Zabbix when the Configuration was Wrong
#Created by Matthew Stidolph
Param
(
    $Serername,

    $Schoolcreds
)
$zabbixstatus = Get-Service -Name "Zabbix Agent" -ComputerName $Serername 

if($zabbixstatus.Name -eq "Running") {
    Set-Service $zabbixstatus.Status -Status Stopped

    Rename-Item -Path "Rename the Old Configuration Here"

    Copy-Item -Path "Source Location" -Destination "Destination Location"

    Get-Service $zabbixstatus.Status | Set-Service -Status "Running"

    Write-Output $zabbixstatus

}
