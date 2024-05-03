allLogs=""
file="/var/log/apache2/access.log"

function countPages() {
	awk '{print $7}' "$file" | sort |uniq -c
}

countPages
