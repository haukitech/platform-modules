/**
* # Atlantis CI
*
* This Terraform module sets up Atlantis CI running as an ECS service on Fargate.
*/
# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0
terraform {
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.46"
    }

    sops = {
      source  = "carlpett/sops"
      version = "1.0.0"
    }
  }
}

provider "sops" {
}
