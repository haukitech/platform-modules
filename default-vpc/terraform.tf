/**
* # Default VPC
*
* This module configures basic VPC for running all services, including:
*
* * Public and private networks
* * NAT gateway
* * Internet gateway
*
* All resources are configured to use multiple availability zones for high availability.
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
