/**
*  # Atlantis CI Permissions
*
*  This module creates an administrator role for Atlantis CI to manage infrastructure on a particular account.
*/
# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0
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
