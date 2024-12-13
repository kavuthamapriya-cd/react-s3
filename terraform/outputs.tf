# S3 Static Website Endpoint
output "website_endpoint" {
  description = "URL of the S3 static website"
  value       =   value = aws_s3_bucket_website_configuration.react_app_website.website_endpoint
}

# S3 Bucket Name 
output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.react_app.bucket
}

