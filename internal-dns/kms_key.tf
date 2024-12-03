# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_kms_key" "signing" {
  provider = aws.us-east-1

  customer_master_key_spec = "ECC_NIST_P256"
  key_usage                = "SIGN_VERIFY"
  deletion_window_in_days  = 7
}

resource "aws_kms_alias" "signing" {
  provider = aws.us-east-1

  name          = "alias/${var.resource_prefix}-dnssec-${replace(aws_route53_zone.internal.name, ".", "-")}"
  target_key_id = aws_kms_key.signing.id
}

resource "aws_kms_key_policy" "signing" {
  provider = aws.us-east-1

  key_id = aws_kms_key.signing.id
  policy = data.aws_iam_policy_document.signing_key.json
}
