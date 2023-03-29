# ---------------------------------------------
# S3 static bucket
# ---------------------------------------------
resource "aws_s3_bucket" "s3_static_bucket" {
  bucket = "ba-for-paradigm-shift-spa-terraform"

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket_public_access_block" "s3_static_bucket" {
  bucket                  = aws_s3_bucket.s3_static_bucket.id
  block_public_acls       = false
  block_public_policy     = true # Create
  ignore_public_acls      = false
  restrict_public_buckets = true # Modify
  depends_on = [
    aws_s3_bucket_policy.s3_static_bucket,
  ]
}

resource "aws_s3_bucket_policy" "s3_static_bucket" {
  bucket = aws_s3_bucket.s3_static_bucket.id
  policy = data.aws_iam_policy_document.s3_static_bucket.json
}

data "aws_iam_policy_document" "s3_static_bucket" {
  version = "2012-10-17"
  statement {
    sid       = "Stmt000001"
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.s3_static_bucket.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::683329863355:user/S3"]
    }
  }
}