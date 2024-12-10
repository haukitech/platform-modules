# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "resource_prefix" {
  type        = string
  description = "Resource prefix"
}

variable "state_bucket" {
  type        = string
  description = "Terraform state S3 bucket name"
}

variable "state_sku_key" {
  type        = string
  description = "Terraform state SKU key"
}
