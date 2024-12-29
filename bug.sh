#!/bin/bash

# This script attempts to process files in a directory, but has a subtle bug.

find . -name '*.txt' -print0 | while IFS= read -r -d $'\0' file; do
  # The bug is here: the file is processed within the subshell, and any changes made 
  # inside the subshell are not reflected outside of it.
  ( 
    echo "Processing: $file" 
    # Simulate some file processing.  The output is written to file_processed.txt
    echo "Processed $file" > file_processed.txt
  )
done

# This will print "file_processed.txt" only once after processing all files.
# The file will only contain the output for the last processed file.

# Try running this script with multiple .txt files in the current directory.

# Expected Behavior:
# The script should process each file and write a separate "Processed $file" message to file_processed.txt for each file

# Actual Behavior:
# Only the last file's processing result is written to file_processed.txt
