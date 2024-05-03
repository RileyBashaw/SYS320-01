
#!/bin/bash
url="http://10.0.17.5/IOC.html"
output_file="IOC.txt"
content=$(curl -s "$url")
echo "$content" | awk -F'</?td>' '/<tr>/ { getline; print $2 }' > "$output_file"
