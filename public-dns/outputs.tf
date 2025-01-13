# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "zone_id" {
  value       = aws_route53_zone.public.zone_id
  description = "Alias configuration for the public hosted zone"
}

output "zone_arn" {
  value       = aws_route53_zone.public.arn
  description = "ARN for the public hosted zone"
}

output "delegation_set_id" {
  value       = aws_route53_delegation_set.public.id
  description = "ID for the public delegation set"
}

output "delegation_set_arn" {
  value       = aws_route53_delegation_set.public.arn
  description = "ARN for the public delegation set"
}

output "zone_name" {
  value       = aws_route53_zone.public.name
  description = "Name for the public hosted zone"
}

output "nameservers" {
  value       = aws_route53_delegation_set.public.name_servers
  description = "List of nameservers for the public hosted zone"
}

output "ds_record" {
  value       = aws_route53_key_signing_key.public.ds_record
  description = "DS record to add to the public zone to establish the chain of trust"
}
