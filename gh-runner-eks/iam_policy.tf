# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

data "aws_iam_policy_document" "eks" {
  statement {
    effect = "Allow"
    actions = [
      "eks:ListClusters",
      "eks:DescribeCluster",
    ]
    resources = [
      data.aws_eks_cluster.target_cluster.arn
    ]
  }
}

data "aws_iam_policy_document" "kms" {
  statement {
    effect = "Allow"
    actions = [
      "kms:Decrypt",
    ]
    resources = [
      aws_kms_key.secrets_sops.arn
    ]
  }
}

resource "aws_iam_policy" "github_runner_kms_policy" {
  name   = "${var.resource_prefix}-kms-policy"
  policy = data.aws_iam_policy_document.kms.json
}

resource "aws_iam_policy" "github_runner_eks_policy" {
  name   = "${var.resource_prefix}-eks-policy"
  policy = data.aws_iam_policy_document.eks.json
}
