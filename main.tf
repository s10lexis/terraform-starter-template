locals {
  greeting = "Hello from a clean Terraform starter!"
}

resource "null_resource" "example" {
  triggers = { message = local.greeting }
}

# Optional AWS example behind a toggle
resource "aws_s3_bucket" "example" {
  count  = var.create_example ? 1 : 0
  bucket = var.example_bucket_name
  tags   = var.tags
}
