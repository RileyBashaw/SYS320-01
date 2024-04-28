function ipcount {
    param (
        [string]$page,
        [string]$hcode,
        [string]$browser
    )

    $accessLogPath = "C:\xampp\apache\logs\access.log"
    $notFounds = Get-Content $accessLogPath | Select-String -Pattern $hcode | Select-String -Pattern $browser | Select-String -Pattern $page

    $regex = [regex] "([0-9]{1,3}\.){3}[0-9]{1,3}"
    $matches = $regex.Matches($notFounds) | ForEach-Object { $_.Value }

    $ips = $matches | Where-Object { $_ -like "10.*" }

    $counts = $ips | Group-Object | Select-Object Count, Name

    return $counts
}

# Calls the ipcount function with parameters
$logs = ipcount 'index.html' '404' 'Mozilla'

$logs
