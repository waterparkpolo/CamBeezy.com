variable "bucket_name" {
  description = "Name of the S3 bucket hosting the static site (must match the registered domain for apex website hosting)"
  type        = string
  default     = "cambeezy.com"
}

variable "domain_name" {
  description = "Root domain name, with trailing dot, as registered in Route 53"
  type        = string
  default     = "cambeezy.com."
}
