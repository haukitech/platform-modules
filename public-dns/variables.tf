# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

variable "aws_account_id" {
  type        = string
  description = "AWS account number"
}

variable "default_tags" {
  type        = map(string)
  description = "Default resource tags injected by Terragrunt"
}

variable "resource_prefix" {
  type        = string
  description = "Default resource prefix injected by Terragrunt"
}

variable "root_dns_zone" {
  type        = string
  description = "Default to store root DNS zone name"
}

variable "public_zone_name" {
  type        = string
  description = "Public DNS zone name"
}
