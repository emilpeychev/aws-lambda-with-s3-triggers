# Step 4: Create our lambda function
resource "aws_lambda_function" "demo_lambda" {
  function_name    = "demo-lambda"
  role             = aws_iam_role.demo-lambda-role.arn
  handler          = "default_python.lambda_handler" // needs to match the python-filename & handler name in the file.
  runtime          = "python3.8"
  filename         = "${path.module}/python/demo_lambda.zip"
  depends_on = [ aws_iam_role_policy_attachment.demo-lambda-attachment ]
  source_code_hash = filebase64sha256("${path.module}/python/demo_lambda.zip")
}
# Step 4.1 CloudWatch logs
resource "aws_cloudwatch_log_group" "demo_lambda" {
  name = "/aws/lambda/${aws_lambda_function.demo_lambda.function_name}"
  retention_in_days = 14 // Purge logs after 14 days to reduce cost.
}
