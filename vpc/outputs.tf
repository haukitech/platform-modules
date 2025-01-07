# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "CIDR blocks for public subnets"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "CIDR blocks for private subnets"
}

output "azs_in_use" {
  value       = var.azs_in_use
  description = "List of Availability Zones (AZs) in use for creating subnets within the VPC"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID of the VPC"
}
