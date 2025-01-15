# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

variable "public_vpc_cidr" {
  type        = string
  description = "CIDR block for public subnets"
}

variable "private_vpc_cidr" {
  type        = string
  description = "CIDR block for private subnets"
}

variable "resource_prefix" {
  type        = string
  description = "Resource prefix"
}

variable "azs_in_use" {
  type        = list(string)
  description = "List of the availability zones in use"
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "Tags for private subnet"
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Tags for public subnet"
}
