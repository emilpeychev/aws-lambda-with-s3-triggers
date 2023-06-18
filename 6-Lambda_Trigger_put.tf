#Step 6: Create the lambda trigger for S3
resource "aws_s3_bucket_notification" "lambda_trigger" {
  bucket = "my-lambda-bucket15-06-2023"

  lambda_function {
    lambda_function_arn = aws_lambda_function.demo_lambda.arn
    events              = ["s3:ObjectCreated:Put"]
    filter_prefix       = ""
    filter_suffix       = "" 
  }
  depends_on = [aws_lambda_permission.s3_permission_to_trigger_lambda]
}
#Step 6.1: Permissions for lambda to be invoked form s3
resource "aws_lambda_permission" "s3_permission_to_trigger_lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.demo_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.demo_bucket.arn
}
# You may need to create an IAM inline_policy for terraform user or group | see s3_iam_get_object.txt !