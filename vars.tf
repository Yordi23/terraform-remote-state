variable "AWS_REGION" {
  type    = string
  default = "us-east-1"
}

variable "AWS_PROFILE" {
  type    = string
  default = "terraform-test"
}

variable "ENVIRONMENT" {
  type    = string
  default = "dev"
}

variable "PROJECT_NAME" {
  type = string
}

variable "PROJECT_NAME_LOWER" {
  type = string
}
