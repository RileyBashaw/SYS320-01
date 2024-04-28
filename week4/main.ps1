$notFounds = Get-Content "C:\xampp\apache\logs\access.log" | Select-String -Pattern '404'
$regex = [regex] "([0-9]{1,3}\.){3}[0-9]{1,3}"
$matches = $regex.Matches($notFounds) | ForEach-Object { $_.Value }
$matches | Where-Object { $_ -like "10.*" }

# Calls the ipcount function with parameters
$logs = ipcount 'index.html' '404' 'Mozilla'

$logs



