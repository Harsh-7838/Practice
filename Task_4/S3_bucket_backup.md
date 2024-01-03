### using Python 

First it will be using the boto3 a AWS SDK for python to interact with AWS services.
Provide source and destination buckets
Then it creates a new client to interact with S3.
Then it creates a dictionary of objects in the source bucket
After that iterates through the list and copy it to the destination using copy_object method.


### using Bash

Provide it two inputs your s3 bucket and the directory where you want to clone your s3 bucket data
It first check's if all the inputs are given or not.
Then if backup is successful or failed it will print accordingly.


