# Zipped file is sent to S3
resource "aws_s3_object" "demo_lambda" {
  bucket = aws_s3_bucket.demo_bucket.id

  key    = "demo_bucket.zip" // Lamda function name in you bucket
  source = data.archive_file.lambda_zip.output_path
  etag = filemd5(data.archive_file.lambda_zip.output_path)
}