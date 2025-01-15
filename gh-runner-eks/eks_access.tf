# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_eks_access_entry" "github_runner" {
  cluster_name  = var.eks_cluster_name
  principal_arn = module.github_worker_role.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "github_runner" {
  cluster_name  = aws_eks_access_entry.github_runner.cluster_name
  principal_arn = aws_eks_access_entry.github_runner.principal_arn
  policy_arn    = var.is_cluster_admin ? var.aws_managed_policy_eks_cluster_admin : var.aws_managed_policy_eks_edit

  access_scope {
    type       = var.is_cluster_admin ? "cluster" : "namespace"
    namespaces = var.deploy_namespaces
  }
}
