# Step 3: Zip the Python file to be ready for S3
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir = "${path.module}/python/"
  output_path = "${path.module}/python/demo_lambda.zip"
}


