. (Join-Path $PSScriptRoot "champscraping.ps1")

clear
$FullTable = gatherClasses

$FullTable = daysTranslator $FullTable

#lists all classes w/ Instructor Furkan Paligu
#$FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" |
    #Where-Object {$_.Instructor -ilike "Furkan Paligu" }

#Lists classes in Joyce 310

#$FullTable | where-object {($_.Location -ilike "JOYC 310") -and ($_.days -contains "Monday")} | 
             #sort "Time Start" | 
             #select "Time Start", "Time End", "Class Code"


#Make a list of all the instructors that teach at least 1 course in
#SYS, SEC, NET, FOR, CSI, DAT
# Sort by name, and make it unique
#$ITSInstructors = $FullTable | where-object { ($_."Class Code" -ilike "SYS*") -or `
                                              #($_."Class Code" -ilike "NET*") -or `
                                              #($_."Class Code" -ilike "SEC*") -or `
                                              #($_."Class Code" -ilike "FOR*") -or `
                                              #($_."Class Code" -ilike "CSI*") -or `
                                              #($_."Class Code" -ilike "DAT*")} `
                             #| Sort-Object "Instructor" `
                             #| select "Instructor" -Unique

#$ITSInstructors

# Group all the instructors by the number of classes they are teaching
$FullTable | where { $_.Instructor -in $ITSInstructors.Instructor } `
           | group-object "Instructor" | Select Count,Name | Sort-Object Count -Descending