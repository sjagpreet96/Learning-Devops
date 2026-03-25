#!/bin/bash

echo "Fetching the files..."

# Use argument or default to current directory
dir="${1:-.}"

# Check if directory exists
if [ ! -d "$dir" ]; then
    echo "Directory does not exist!"
    exit 1
fi

# Function to create folder and move file
chk_move() {
    local folder="$1"
    local file="$2"

    if [ ! -d "$folder" ]; then
        mkdir "$folder"
        echo "$folder created"
    fi

    mv "$file" "$folder/"
    echo "$file moved successfully"
}

# Go to target directory
cd "$dir" || exit

# Iterate files
for file in *; do
    if [ -f "$file" ]; then
        echo "Working on $file"

        # Handle files without extension
        if [[ "$file" != *.* ]]; then
            file_type="no_extension"
        else
            file_type="${file##*.}"
        fi

        chk_move "${file_type}_files" "$file"
    fi
done

echo "Sorting completed!"
