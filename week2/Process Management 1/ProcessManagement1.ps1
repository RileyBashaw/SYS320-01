#Script1
#$processes = Get-Process | Where-Object { $_.ProcessName -like 'C*' }

#foreach ($Processes in $processes) {
	#Write-Host "Process Name: $($Processes.ProcessName)"
	#Write-Host "Process ID  : $($Processes.Id)"
	#Write-Host "--------------------------"
#}

# If no matching processes found, display a message
#if ($Processes.Count -eq 0) {
	#Write-Host "No processes found with ProcessesName starting with 'C'."
#}

#Script2
#$processes = Get-Process | Where-Object { $_.path -notlike '*system32*' }

#foreach ($Processes in $processes) {
	#Write-Host "Process Name: $($Processes.ProcessName)"
	#Write-Host "Process ID  : $($Processes.Id)"
	#Write-Host "--------------------------"
#}
#Script3
#$csvFilePath = "C:\Users\champuser\SYS320-01\week2\StoppedServ.csv"
#$data = @()

#$services = Get-Service | Where-Object { $_.Status -eq 'Stopped' }

#foreach ($Services in $services) {
	#Write-Host "Service Name: $($Services.DisplayName)"
	#Write-Host "Service ID  : $($Services.ServiceName)"
	#Write-Host "--------------------------"

    #$serviceInfo = [PSCustomObject]@{
        #"ServiceName" = $Services.DisplayName
        #"ServiceID"   = $Services.ServiceName

    #}

    #$data += $serviceInfo

#$data | Export-Csv -Path $csvFilePath -NoTypeInformation
#}

#Script4
$chromePro = Get-Process -Name chrome -ErrorAction SilentlyContinue

if ((Get-Process -Name "*Chrome*") -eq $null) {
Start-Process "chrome" -ArgumentList "https://www.champlain.edu"
}
else {
    Stop-Process -Name chrome
}
