# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_route53_zone" "internal" {
  name              = "${var.sku_code}.${var.env_code}.internal.${var.root_dns_zone}"
  delegation_set_id = aws_route53_delegation_set.internal.id
  comment           = "Hosted zone for internal services."
}

resource "aws_route53_delegation_set" "internal" {
  reference_name = "${var.sku_code}.${var.env_code}.internal.${var.root_dns_zone}"
}

resource "aws_route53_key_signing_key" "internal" {
  name                       = "internal"
  hosted_zone_id             = aws_route53_zone.internal.id
  key_management_service_arn = aws_kms_key.signing.arn
}

resource "aws_route53_hosted_zone_dnssec" "internal" {
  depends_on = [
    aws_route53_key_signing_key.internal,
    aws_kms_key_policy.signing
  ]
  hosted_zone_id = aws_route53_key_signing_key.internal.hosted_zone_id
}
