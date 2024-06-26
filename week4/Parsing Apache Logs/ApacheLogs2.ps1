function ApacheLogs1(){
$logsNotformatted = Get-Content C:\xampp\apache\logs\access.log
$tableRecords = @()

for ($i=0; $i -ne $logsNotformatted.Length; $i++){

#splits a string into words
$words = $logsNotformatted[$i].Split(" ");

    $tableRecords += [PSCustomObject]@{ "IP" = $words[0]
                                        "Time" = $words[3].Trim('[')
                                        "Method" = $words[5].Trim('"')
                                        "Page" = $words[6]
                                        "Protocol" = $words[7]
                                        "Response" = $words[8]
                                        "Referrer" = $words[10]
                                        "Client" = $words[11..($words.Length)] }


} #End of for loop

    return $tablerecords | Where-Object { $_.IP -ilike "10.*" }

}
$tableRecords = ApacheLogs1
$tableRecords | Format-Table -AutoSize -Wrap
