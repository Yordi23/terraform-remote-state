# Data source to get current AWS account information
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.PROJECT_NAME_LOWER}-terraform-state-bucket-${var.ENVIRONMENT}"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "Terraform State Bucket for ${var.PROJECT_NAME} project"
    Environment = var.ENVIRONMENT
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket_sse" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.PROJECT_NAME_LOWER}-terraform-lock-${var.ENVIRONMENT}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "Terraform State Lock Table for ${var.PROJECT_NAME} project"
  }
}
