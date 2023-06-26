# DynamoDb and Lambda project

# To Run a Project
- terraform init
- terraform plan
- terraform apply

# Workflow

Once you push an event.json file to the s3 bucket, lambda will insert the records to DynamoDb table

# Infrastructure created

- S3 bucket
- DynamoDB table
- Lambda function
- Lambda role
- Lambda S3 trigger

# Here we use s3:ObjectCreated:* events to trigger lambda function
