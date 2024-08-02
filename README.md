# Custom Wordlist Generator for Fuzzing

This repository contains a Bash script that recursively scans webserver files to generate a custom wordlist for fuzzing. The script lists all file and folder names, ensuring no duplication, and includes both the full names with extensions and the names without extensions.

## Features

- Recursively navigate through all subdirectories.
- Write file and folder names to an output file.
- Ensure no duplicate entries.
- Handle file extensions by writing both the full name and the name without the extension.

## Usage

### Prerequisites

- A Unix-like operating system (Linux, macOS).
- Bash shell.

### Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/custom-wordlist-generator.git
   cd custom-wordlist-generator
   ```
2. Make the script executable:
   ```bash
   chmod +x list_directory_recursive.sh
   ```

3.Run the script with the directory you want to scan and the output file:
   ```bash
   ./list_directory_recursive.sh /path/to/webserver/files output_wordlist.txt
```

Replace /path/to/webserver/files with the path to the webserver directory you want to scan, and output_wordlist.txt with the desired name of the output file.
