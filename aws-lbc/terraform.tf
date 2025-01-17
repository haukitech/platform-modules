/**
* # AWS Load Balancer Controller
*
* This Terraform module creates resources needed for the
* AWS Load Balancer Controller.
*
* AWS Load Balancer Controller is installed and managed in the Kubernetes cluster
* in this repository https://github.com/kamu-data/kamu-cluster.
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
