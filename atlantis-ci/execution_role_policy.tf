# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

data "aws_iam_policy_document" "assume_local_account_roles" {
  statement {
    effect    = "Allow"
    resources = var.local_atlantis_role_arns

    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]
  }
}

resource "aws_iam_policy" "assume_local_account_roles" {
  policy = data.aws_iam_policy_document.assume_local_account_roles.json
}