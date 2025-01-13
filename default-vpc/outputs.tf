# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0
#test

output "vpc_id" {
  value       = aws_vpc.default.id
  description = "ID of the VPC"
}

output "public_subnet_ids" {
  value       = [for sub in aws_subnet.old_public : sub.id]
  description = "List of ID for public subnet"
}

output "private_subnet_ids" {
  value       = [for sub in aws_subnet.old_private : sub.id]
  description = "List of ID for private subnet"
}

output "new_public_subnets" {
  value       = { for sub in aws_subnet.public : sub.availability_zone => sub.id }
  description = "Mapping of availability zone names to public subnet IDs"
}

output "new_private_subnets" {
  value       = { for sub in aws_subnet.private : sub.availability_zone => sub.id }
  description = "Mapping of availability zone names to private subnet IDs"
}
