variable "aws_region" {
  description = "AWS region for provider and backend bucket"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Common tags to apply to supported resources"
  type        = map(string)
  default = {
    Project   = "terraform-starter"
    ManagedBy = "terraform"
  }
}

variable "create_example" {
  description = "Whether to create the example S3 bucket"
  type        = bool
  default     = false
}

variable "example_bucket_name" {
  description = "Name for the example S3 bucket (if enabled)"
  type        = string
  default     = null
}
