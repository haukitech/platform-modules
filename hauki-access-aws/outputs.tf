# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "hauki_role_arn" {
  value       = module.hauki_engineer.iam_role_arn
  description = "ARN of the created IAM role"
}

output "hauki_engineer_access_policy_arn" {
  value       = aws_iam_policy.hauki_engineer_access.arn
  description = "ARN of the policy granted to the created role"
}
