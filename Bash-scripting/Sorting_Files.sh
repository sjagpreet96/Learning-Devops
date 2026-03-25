#!/bin/bash
echo "Fetching the files"

#function to check if directory exist already if not then create one

chk_move() {
	local dir="$1"
	local file="$2"
	if [ ! -d "$dir" ]; then
		mkdir "$dir"
		echo "$dir created"
	fi
	mv "$file" "$dir"
	echo "$file moved successfully"	
}

for file in *; do
	if  [ -f "$file" ]; then
		echo "Working on $file"
		file_type="${file##*.}"
		result=$(chk_move "$file_type" "$file")
		echo "$result"
	fi
done
