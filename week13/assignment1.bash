#!/bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

    echo -n "Please Input an Instructor Full Name: "
    read instName

    echo ""
    echo "Courses of $instName :"
    grep "$instName" "$courseFile" | cut -d';' -f1,2 | sed 's/;/ | /g'
    echo ""

}

function courseCountofInsts(){

    echo ""
    echo "Course-Instructor Distribution"
    cut -d':' -f7 "$courseFile" | grep -v "/" | grep -v "\.\.\." | sort | uniq -c | sort -nr
    echo ""

}

function classlocations(){
    echo ""
    echo -n "Insert Classroom Name: "
    read Input
    grep "$Input" "$courseFile" | cut -d';' -f1,2,5,6,7 | sed 's/j/ | /g'
    echo ""
}

function openseats(){
    echo ""
    echo "Open seats within courses"
    echo -n "Insert Subject Title: "
    read subjectInput
    while read -r text
    do
        seats=$(echo "$text" | cut -d';' -f4)
        if [[ "$seats" -gt "0" ]]; then
            echo "$text" | sed 's/;/ | /g'
        fi
    done < "$courseFile"
    echo ""
}

while :
do
    echo ""
    echo "Please select an option:"
    echo "[1] Display courses of an instructor"
    echo "[2] Display course count of instructors"
    echo "[3] Display class locations"
    echo "[4] Display open seats in a class"
    echo "[5] Exit"

    read userInput
    echo ""

    case $userInput in
        1) displayCoursesofInst ;;
        2) courseCountofInsts ;;
        3) classlocations ;;
        4) openseats ;;
        5) echo "Goodbye" && exit ;;
        *) echo "Invalid input. Please try again." ;;
    esac
done
