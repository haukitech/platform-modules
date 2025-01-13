/**
* # Hauki access
*
*  This Terraform module allows Hauki engineers to access AWS account where it is installed.
*/
terraform {
  required_version = ">= 1.0.0"
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31"
    }
  }
}
