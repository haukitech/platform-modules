/**
* # GitHub Actions OIDC provider
*
* This Terraform module creates an OIDC provider for GitHub Actions. It is used to
* assume IAM roles directly from GitLab runners.
*
* AWS secures connection to the IdP with its own library of trusted certificates.
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
