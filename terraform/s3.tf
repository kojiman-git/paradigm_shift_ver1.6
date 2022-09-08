
# ---------------------------------------------
# S3 static bucket
# ---------------------------------------------
resource "aws_s3_bucket" "s3_static_bucket" {
  bucket = "ba-for-paradigm-shift-terraform"

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket_public_access_block" "s3_static_bucket" {
  bucket                  = aws_s3_bucket.s3_static_bucket.id
  block_public_acls       = false
  block_public_policy     = false # Create
  ignore_public_acls      = false
  restrict_public_buckets = false # Modify
  
}



