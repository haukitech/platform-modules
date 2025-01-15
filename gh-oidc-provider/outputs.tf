# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "provider_arn" {
  value       = module.iam_github_oidc_provider.arn
  description = "ARN of the created OIDC provider"
}

output "provider_url" {
  value       = module.iam_github_oidc_provider.url
  description = "URL of the created OIDC provider"
}
