/**
*  # EKS
*
*  This Terraform module creates and configures an EKS cluster for Kamu
*  services.
*
*  The access is managed with EKS API by creating access entries.
*/
terraform {
  required_version = ">= 1.0.0"
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.46"
    }
  }
}
