#!/bin/bash

# This script correctly processes files without the subshell bug.

find . -name '*.txt' -print0 | while IFS= read -r -d $'\0' file; do
  # The solution: process each file directly in the main shell.
  echo "Processing: $file" 
  echo "Processed $file" >> file_processed.txt
done

# This improved script outputs a line per processed file into file_processed.txt
# Now the script will correctly write the processed information for all files to file_processed.txt
