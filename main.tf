provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "sample_s3" {
  bucket = "sample_s3"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_policy" "sample_s3" {
  bucket = "${aws_s3_bucket.sample_s3.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "sample_s3-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "arn:aws:iam::##acount_id##:role/##role_name##",
            "arn:aws:iam::##acount_id##:user/##user_name##"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.sample_s3.id}/*"
    }
  ]
}
POLICY
}