provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "sample_s3" {
  bucket = "sample_s3"
}
