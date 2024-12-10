# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "iam_role_arn" {
  value       = module.iam_assumable_role_admin.iam_role_arn
  description = "ARN of the created IRSA IAM role for AWS LBC"
}