(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).IPAddress

(Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet0"}).PrefixLength


Get-WmiObject -List | Where-Object { $_.Name -ilike "win32_net*" } | Sort-Object Name

Get-CimInstance win32_NetworkAdapterConfiguration -Filter "DHCPEnabled = True" | Select-Object DHCPServer | Format-Table -HideTableHeaders


(Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ilike "Ethernet*" }).ServerAddress[0] 



cd $PSScriptRoot

$files=(Get-ChildItem)
for ($j=0; $j -le $files.Count; $j++){
    if ($files[$j].Extension -ilike "*.ps1"){
        Write-Host $files[$j].Name

    }
}



$folderpath="C:\Users\champuser\SYS320-01\week2\outfolder"
if (Test-Path $folderpath){
    Write-Host "Folder Already Exists"

}
else{
    New-Item -ItemType Directory -Path $folderpath
}


cd $PSScriptRoot
$files=(Get-ChildItem)

$folderPath = "C:\Users\champuser\SYS320-01\week2\outfolder"
$filePath = Join-Path $folderPath "out.csv"

$files | Where-Object {$_.Extension -eq ".ps1" } |
Export-Csv -Path $filePath

cd C:\Users\champuser\SYS320-01\week2

$files= Get-ChildItem -Path $PSScriptRoot Recurse -Include *.csv
$files | ForEach-Object { $_.FullName -replace '\.csv$', '.log' | Rename-Item -NewName {$_} -Whatif }
Get-ChildItem -Path $PSScriptRoot -Recurse -File

