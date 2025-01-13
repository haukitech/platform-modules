# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

module "github_worker_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
  version = "5.34.0"

  create = true
  name   = "${var.resource_prefix}-github-runner-${data.aws_region.current.name}"
  policies = {
    kms = aws_iam_policy.github_runner_kms_policy.arn
    eks = aws_iam_policy.github_runner_eks_policy.arn
  }

  max_session_duration = 3600
  subjects             = [for repo in var.github_repositories : "${repo}:*"]
}
