#Get-Content C:\xampp\apache\logs\access.log

#Get-Content C:\xampp\apache\logs\access.log -tail 5

#Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern '404','400'


#Get-Content C:\xampp\apache\logs\access.log | Select-String -NotMatch '200'






#$A = Get-Childitem -Path C:\xampp\apache\logs\*.log | Select-String -Pattern 'error' 
#$A[-5..-1]

#$notFounds = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern '404'

#$regex = [regex] "([0-9]{1,3}\.){3}[0-9]{1,3}"

#$ipsUnorganized = $regex.Matches($notFounds)

#$ips = @()
#for($i=0; $i -lt $ipsUnorganized.Count; $i++){
#$ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value;}
#}

#$ipsoftens = $ips | where-object { $_.IP -ilike "10.*" }

#$counts = $ipsoftens | Group-Object IP
#$counts | Select-Object Count, Name

<#
$notFounds = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern '404'
$regex = [regex] "([0-9]{1,3}\.){3}[0-9]{1,3}"
$ipsUnorganized = $regex.Matches($notFounds)
$ips = @()
foreach($match in $ipsUnorganized){
    $ips += [pscustomobject]@{ "IP" = $match.Value;}
}
$ipsoftens = $ips | Where-Object { $_.IP -like "10.*" }
$counts = $ipsoftens | Group-Object -Property IP
$counts | Select-Object Count, Name
#>


$notFounds = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern '404'
$regex = [regex] "([0-9]{1,3}\.){3}[0-9]{1,3}"
$matches = $regex.Matches($notFounds) | ForEach-Object { $_.Value }
$matches | Where-Object { $_ -like "10.*" }




