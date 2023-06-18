terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      // You can use "random_pet" with bucket
      source  = "hashicorp/random"
      version = "~> 3.3.0"
    }
    archive = {
      // For zipping the files.
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }
  // CLI
  required_version = "~> 1.0"
}
  
provider "aws" {
// New feature that will tag all the resources accross your poject.
 default_tags {
   tags = {
     Environment = "dev"
     Project     = "demo-app"
   }
 }
}
