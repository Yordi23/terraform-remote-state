# AWS Account Information Outputs
output "aws_account_id" {
  description = "The AWS Account ID being used"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_user_arn" {
  description = "The ARN of the AWS user/role being used"
  value       = data.aws_caller_identity.current.arn
}

output "aws_user_id" {
  description = "The AWS user ID being used"
  value       = data.aws_caller_identity.current.user_id
}

# Resource Outputs
output "s3_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Terraform locks"
  value       = aws_dynamodb_table.terraform_locks.name
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket for Terraform state"
  value       = aws_s3_bucket.terraform_state.arn
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table for Terraform locks"
  value       = aws_dynamodb_table.terraform_locks.arn
}
