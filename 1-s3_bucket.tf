# Step 1: Create S3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-lambda-bucket15-06-2023"  // Replace with your desired bucket name # I am using a static name but you can use "random_pet"
  force_destroy = true // Will destroy bucket and objects upon "terraform destroy"
lifecycle {
    create_before_destroy = true // Will first create a new bucket and then destroy the old one.
  }
}