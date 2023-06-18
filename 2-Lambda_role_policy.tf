# Step 2: Create Lambda AssumeRole Policy
resource "aws_iam_role" "demo-lambda-role" {
  name               = "demo-lambda-role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }]
  })
}

# Step 2.1: Attach Role to Policy
resource "aws_iam_role_policy_attachment" "demo-lambda-attachment" {
  role       = aws_iam_role.demo-lambda-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  depends_on = [ data.archive_file.lambda_zip ]
}