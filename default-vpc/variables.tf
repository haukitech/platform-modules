# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

variable "resource_prefix" {
  type        = string
  description = "Resource prefix"
}

variable "old_public_vpc_cidr" {
  type        = string
  description = "Old CIDR block for public subnets"
}

variable "old_private_vpc_cidr" {
  type        = string
  description = "Old CIDR block for private subnets"
}

variable "public_vpc_cidr" {
  type        = string
  description = "CIDR block for public subnets"
}

variable "private_vpc_cidr" {
  type        = string
  description = "CIDR block for private subnets"
}

variable "nat_gw_public_az_id" {
  type        = string
  description = "ID of the availability zone to create the public endpoint of the NAT"
}

variable "azs_in_use" {
  type        = list(string)
  description = "List of the availability zones in use"
}
