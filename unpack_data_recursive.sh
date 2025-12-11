#!/usr/bin/env sh

# Recursively search the file tree from this directory and unpack all files.
# This is generally already handled by the data curation code, but it's
# occasionally useful (e.g. if you need to reinitialize the repo for some reason).

# Extract each file within the directory that the file is stored in
#find . -type f -name "*.tar.gz" -exec tar -xvf {} -C $(dirname {}) \;

for file in $(find data/ -type f -name "*.tar.gz"); do
    echo "    -> Extracting $file"
    tar -xvf "$file" -C $(dirname "$file")
done
