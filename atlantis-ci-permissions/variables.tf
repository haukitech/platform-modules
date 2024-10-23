# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

variable "atlantis_main_iam_role_arn" {
  type        = string
  description = "Used by the module to generate the trust policy"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "state_bucket" {
  type        = string
  description = "Terraform state S3 bucket name"
}

variable "state_sku_key" {
  type        = string
  description = "Terraform state SKU key"
}

variable "firefighters_iam_role_arn" {
  type        = string
  description = "ARN of the provisioned IAM role for the Firefighters"
}

variable "resource_prefix" {
  type        = string
  description = "Default resource prefix injected by Terragrunt"
}
