# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

module "hauki_engineer" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.33.0"

  role_name         = "${local.prefix}-engineer"
  role_description  = "Engineers from partner org hauki.tech assume this role to work on our deployments"
  create_role       = true
  role_requires_mfa = false

  create_custom_role_trust_policy = true
  custom_role_trust_policy        = data.aws_iam_policy_document.allow_assumption_to_hauki_external.json

  custom_role_policy_arns = [
    aws_iam_policy.hauki_engineer_access.arn,
  ]
}
