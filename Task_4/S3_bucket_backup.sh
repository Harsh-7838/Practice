#!/bin/bash

# Check if required arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <source_bucket> <local_backup_directory>"
  exit 1
fi

# Assign script arguments to variables
source_bucket="$1"
local_backup_dir="$2"

# AWS CLI command to sync the S3 bucket to a local directory
aws s3 sync "s3://$source_bucket" "$local_backup_dir"

# Check if the sync command was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully."
else
  echo "Backup failed."
fi
