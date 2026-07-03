variable "state_bucket_name" {
  description = "Name of the S3 bucket that will hold Terraform remote state for cambeezy.com"
  type        = string
  default     = "cambeezy-com-tfstate"
}

variable "lock_table_name" {
  description = "Name of the DynamoDB table used for Terraform state locking"
  type        = string
  default     = "cambeezy-com-tfstate-lock"
}
