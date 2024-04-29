#Get-EventLog System -source Microsoft-Windows-Winlogon


# Get login and logoff records from Windows Events and save to a variable
# Get the last 14 days
$loginouts = Get-EventLog System -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-14)

$loginoutsTable = @() # Empty array to fill customly
for($i=0; $i -ne $loginouts.Count; $i++){

#creating event property value
$event = ""
if($loginouts[$i].InstanceId -eq 7001) {$event="Logon"}
if($loginouts[$i].InstanceId -eq 7002) {$event="Logoff"}

#creating event user property value and translating user ID
$SecID = New-Object System.Security.Principal.SecurityIdentifier($loginouts[$i].ReplacementStrings[1])

$objectUser = $SecID.Translate([System.Security.Principal.NTAccount])

$user = $objectUser.Value

#adding each new line (in form of a custom object) to our empty array
$loginoutsTable += [PSCustomObject]@{
                      "Time" = $loginouts[$i].TimeGenerated;
                        "Id" = $loginouts[$i].InstanceId;
                     "Event" = $event;
                      "User" = $user;
                      }
} # End of for

$loginoutsTable