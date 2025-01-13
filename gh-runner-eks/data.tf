# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

data "aws_region" "current" {}

data "aws_eks_cluster" "target_cluster" {
  name = var.eks_cluster_name
}
