# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

data "aws_iam_policy_document" "allow_assumption_to_hauki_external" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${var.hauki_management_account_number}:root"
      ]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:PrincipalArn"
      values   = [var.hauki_external_iam_role_arn]
    }
  }
}

data "aws_iam_policy_document" "hauki_engineer_access" {
  statement {
    effect = "Allow"

    actions = [
      "*"
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "hauki_engineer_access" {
  name   = "${local.prefix}-engineer-access"
  policy = data.aws_iam_policy_document.hauki_engineer_access.json
}
