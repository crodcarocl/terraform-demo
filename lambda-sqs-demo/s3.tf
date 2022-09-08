resource "aws_s3_bucket" "sqslamdba_s3" {
  bucket = "sqslamdbas3bucket"

  tags = {
    Name        = "sqslamdba_s3_bucket"
  }
}

resource "aws_s3_bucket_acl" "sqslamdba_s3_acl" {
  bucket = aws_s3_bucket.sqslamdba_s3.id
  acl    = "private"
}