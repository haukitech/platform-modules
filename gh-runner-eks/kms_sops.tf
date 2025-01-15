# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_kms_key" "secrets_sops" {
  description             = "KMS key for encrypting/decrypting monitoring secrets."
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "secrets_sops" {
  target_key_id = aws_kms_key.secrets_sops.id
  name          = "alias/${var.resource_prefix}-secrets-sops"
}
