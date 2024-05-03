#!/bin/bash

report="report.html"

if [ ! -f "report.txt" ]; then
    echo "Error: report.txt not found!"
    exit 1
fi

echo "<html>" > "$report"
echo "<head><title>Indicators of Compromise</title><style> table, th, td {border: 1px solid black;}</style></head>" >> "$report"
echo "<body>" >> "$report"
echo "<p> Access logs with IOC indicators: </p>" >> "$report"
echo "<table>" >> "$report"
echo "<tr><th> IP </th> <th> Date </th> <th> IOC </th></tr>" >> "$report"

while read -r ip date ioc; do
    echo "<tr> <td>$ip</td> <td>$date</td> <td>$ioc</td> </tr>" >> "$report"
done < "report.txt"

echo "</table>" >> "$report"
echo "</body>" >> "$report"
echo "</html>" >> "$report"

if sudo mv "$report" /var/www/html/; then
    echo "HTML report generated and moved to /var/www/html/report.html"
else
    echo "Error: Failed to move HTML report to /var/www/html"
fi
