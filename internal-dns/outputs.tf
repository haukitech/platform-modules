# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "zone_id" {
  value       = aws_route53_zone.internal.zone_id
  description = "ID of the created hosted zone"
}

output "zone_arn" {
  value       = aws_route53_zone.internal.arn
  description = "ARN of the created hosted zone"
}

output "delegation_set_id" {
  value       = aws_route53_delegation_set.internal.id
  description = "ID of the created delegation set"
}

output "delegation_set_arn" {
  value       = aws_route53_delegation_set.internal.arn
  description = "ARN of the created delegation set"
}

output "zone_name" {
  value       = aws_route53_zone.internal.name
  description = "Zone fully qualified domain name"
}

output "nameservers" {
  value       = aws_route53_delegation_set.internal.name_servers
  description = "List of nameservers for the zone"
}

output "ds_record" {
  value       = aws_route53_key_signing_key.internal.ds_record
  description = "DS record to add to the parent zone to establish the chain of trust"
}
