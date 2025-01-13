/**
* # Public DNS
*
* This Terraform module creates necessary AWS resources for the public hosted zone.
*/
terraform {
  required_version = ">= 1.0.0"
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35"
    }
  }
}

# Secondary provider to access KMS
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  allowed_account_ids = [
    var.aws_account_id
  ]

  default_tags {
    tags = var.default_tags
  }
}
