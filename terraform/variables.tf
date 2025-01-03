# AWS Region
variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

# S3 Bucket Name
variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "my-react-app-bucket"
}

# MIME Types for Files
variable "mime_types" {
  description = "Mapping of file extensions to MIME types"
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".json" = "application/json"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".txt"  = "text/plain"
  }
}
