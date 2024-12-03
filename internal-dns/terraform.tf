/**
* # Internal DNS
*
* This Terraform module creates a hosted zone for the internal services
* within the SKU. The zone name is `<SKU>.<ENVIRONMENT>.internal.kamu.dev`
* where `kamu.dev` is the name of the rood DNS zone configurable by variables.
*
*    Note: The module does not create any records in the rood zone.
*          NS and DS records have to be managed there independently.
*/
terraform {
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
