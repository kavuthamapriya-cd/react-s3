# Provider
provider "aws" {
  region = var.aws_region
}

# S3 Bucket Creation
resource "aws_s3_bucket" "react_app" {
  bucket = var.bucket_name
  acl    = "public-read"

  # Enable static website hosting
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

# S3 Bucket Policy for Public Access
resource "aws_s3_bucket_policy" "react_app_policy" {
  bucket = aws_s3_bucket.react_app.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.react_app.arn}/*"
      }
    ]
  })
}

# Upload Build Files to S3
resource "aws_s3_object" "react_app_files" {
  for_each = fileset("${path.module}/../react-app/build", "**")

  bucket       = aws_s3_bucket.react_app.bucket
  key          = each.value
  source       = "${path.module}/../react-app/build/${each.value}"
  content_type = lookup(var.mime_types, each.value, "application/octet-stream")
}
