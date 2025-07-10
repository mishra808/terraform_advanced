resource "aws_s3_bucket" "web_bucket" {
  bucket = "${var.enviroment}-${var.project_name}-web-bucket"
  tags = {
        Name = "${var.enviroment}-${var.project_name}-web-bucket"
    }
}

resource "aws_s3_bucket_cors_configuration" "web_bucket" {
  bucket = aws_s3_bucket.web_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

}

resource "aws_s3_bucket_public_access_block" "public_accessebility" {
  bucket = aws_s3_bucket.web_bucket.id

  block_public_acls       = var.block_public_access
  block_public_policy     = var.block_public_access
  ignore_public_acls      = var.block_public_access
  restrict_public_buckets = var.block_public_access
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.web_bucket.id
  policy = data.aws_iam_policy_document.policy_one.json
}

data "aws_iam_policy_document" "policy_one" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.web_bucket.arn,
      "${aws_s3_bucket.web_bucket.arn}/*",
    ]
  }
}
