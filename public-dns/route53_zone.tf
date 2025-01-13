# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_route53_zone" "public" {
  name              = local.public_zone_fqdn
  delegation_set_id = aws_route53_delegation_set.public.id
  comment           = "Hosted zone for public services."
}

resource "aws_route53_delegation_set" "public" {
  reference_name = local.public_zone_fqdn
}

resource "aws_route53_key_signing_key" "public" {
  name                       = "public"
  hosted_zone_id             = aws_route53_zone.public.id
  key_management_service_arn = aws_kms_key.signing.arn
  depends_on = [
    aws_kms_key_policy.signing
  ]
}

resource "aws_route53_hosted_zone_dnssec" "public" {
  depends_on = [
    aws_route53_key_signing_key.public,
    aws_kms_key_policy.signing
  ]
  hosted_zone_id = aws_route53_key_signing_key.public.hosted_zone_id
}
