# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

data "aws_iam_policy_document" "atlantis_access" {
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

resource "aws_iam_policy" "atlantis_access" {
  name   = "${var.resource_prefix}-atlantis-access-${var.aws_region}"
  policy = data.aws_iam_policy_document.atlantis_access.json
}
