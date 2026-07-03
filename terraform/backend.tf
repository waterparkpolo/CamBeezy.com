terraform {
  backend "s3" {
    bucket         = "cambeezy-com-tfstate"
    key            = "cambeezy-site/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cambeezy-com-tfstate-lock"
    encrypt        = true
  }
}
