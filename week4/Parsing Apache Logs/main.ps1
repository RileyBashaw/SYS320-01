. (Join-Path $PSScriptRoot "ApacheLogs2.ps1")

$tr = ApacheLogs1
$tr | Format-Table -AutoSize -Wrap