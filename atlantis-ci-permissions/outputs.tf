# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "atlantis_role_arn" {
  value       = module.atlantis.iam_role_arn
  description = "ARN of the created IAM role"
}

output "access_policy_arn" {
  value       = aws_iam_policy.atlantis_access.arn
  description = "ARN of the policy granted to the created role"
}
