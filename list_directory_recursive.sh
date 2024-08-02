
### `list_directory_recursive.sh`

#!/bin/bash

# Directory to list
DIR_PATH="$1"
# Output file
OUTPUT_FILE="$2"

# Ensure the output file is empty
> "$OUTPUT_FILE"

# Function to process a file
process_file() {
    local file_name="$1"
    local base_name="${file_name%.*}"
    local extension="${file_name##*.}"

    # Write the file name with extension
    if ! grep -Fxq "$file_name" "$OUTPUT_FILE"; then
        echo "$file_name" >> "$OUTPUT_FILE"
    fi

    # Write the file name without extension if they are different
    if [ "$file_name" != "$base_name" ] && ! grep -Fxq "$base_name" "$OUTPUT_FILE"; then
        echo "$base_name" >> "$OUTPUT_FILE"
    fi
}

# Process each item in the directory
while IFS= read -r -d '' item; do
    item_name=$(basename "$item")
    if [ -f "$item" ]; then
        process_file "$item_name"
    elif [ -d "$item" ]; then
        if ! grep -Fxq "$item_name" "$OUTPUT_FILE"; then
            echo "$item_name" >> "$OUTPUT_FILE"
        fi
    fi
done < <(find "$DIR_PATH" -type f -print0 -o -type d -print0)

echo "Directory contents have been listed in $OUTPUT_FILE"

