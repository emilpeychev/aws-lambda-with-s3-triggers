# aws-lambda-with-s3-triggers

This is an example on how to create a lambda on aws with s3 bucket trigger by using Terraform.

## Set the providers

* Setting the providers will allow flexibility in your code.
* Take advantage of `default tags` to automatically add tags to all resources that belong to the project.

## Set S3 bucket 

* Set the bucket, all details are provided as comments.

## Set python test code

* Use default code or extended code for the function, all details are provided as comments.


## Set Lambda function

* Write your Lambda and push logs to cloudwatch, all details are provided as comments.

## Set Trigger

* Add th trigger with permissions for S3.

## Test function 

```bash
aws lambda invoke --region=your_region --function-name=function_name response.json
cat response.json
```

## Test Trigger

* Upload a photo to S3 and check the logs in cloudwatch.

## Nb!

* This is Part one/three of a bigger project for face recognition app. It will include Rekognition integration and Api.