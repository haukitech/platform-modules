# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "atlantis_public_url" {
  value       = "https://${local.atlantis_domain_name}"
  description = "URL for public access to Atlantis"
}

output "basic_auth_pass" {
  sensitive   = true
  value       = random_password.basic_auth_pass.result
  description = "Generated random password"
}

output "basic_auth_username" {
  sensitive   = true
  value       = "${local.basic_auth_username_prefix}-${random_password.basic_auth_username_suffix.result}"
  description = "Generated username for basic authentication"
}

output "main_atlantis_role_arn" {
  value       = module.atlantis.service.tasks_iam_role_arn
  description = "ARN of the IAM role used by the Atlantis service"
}
