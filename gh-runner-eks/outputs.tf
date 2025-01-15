# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "role_arn" {
  value       = module.github_worker_role.arn
  description = "ARN of the IAM role for GitHub worker"
}

output "kms_key_arn" {
  value       = aws_kms_key.secrets_sops.arn
  description = "ARN of the created KMS key for encrypting secrets"
}

output "kms_key_alias" {
  value       = aws_kms_alias.secrets_sops.name
  description = "Alias of the created KMS key for encrypting secrets"
}

output "aws_kms_key_id" {
  value       = aws_kms_key.secrets_sops.id
  description = "ID of the created KMS key for encrypting secrets"
}
