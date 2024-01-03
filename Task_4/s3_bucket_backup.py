import boto3

source_bucket = 'your-source-bucket'
destination_bucket = 'your-destination-bucket'

s3 = boto3.client('s3')

# List objects in the source bucket
objects = s3.list_objects_v2(Bucket=source_bucket)['Contents']

# Copy each object to the destination bucket
for obj in objects:
    copy_source = {'Bucket': source_bucket, 'Key': obj['Key']}
    s3.copy_object(CopySource=copy_source, Bucket=destination_bucket, Key=obj['Key'])

print(f"Data moved from {source_bucket} to {destination_bucket} successfully.")
