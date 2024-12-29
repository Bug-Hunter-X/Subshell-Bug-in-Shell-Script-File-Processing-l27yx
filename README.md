# Shell Subshell Bug

This repository demonstrates a common, yet subtle, bug in shell scripting involving subshells and file processing.  The script attempts to process multiple text files, but due to the use of a subshell, only the results from the last file are preserved.

## Bug Description

The bug stems from the use of parentheses `()` to create a subshell within the `while` loop.  Changes made within the subshell are not reflected in the parent shell's environment.  This prevents proper accumulation of data when processing multiple files.

## How to Reproduce

1.  Create a few `.txt` files in the same directory as `bug.sh`.
2.  Run the `bug.sh` script.
3.  Observe that `file_processed.txt` only contains the processing result for the last file.

## Solution

The solution avoids subshells, allowing changes to affect the main script's environment.
