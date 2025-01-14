# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

module "eks_efs_addon_iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.34.0"

  create_role = true

  role_name = var.resource_prefix-efs-csi-driver

  provider_url = module.eks-main.oidc_provider

  role_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy",
  ]
  oidc_fully_qualified_audiences = [
    "sts.amazonaws.com",
  ]
  oidc_subjects_with_wildcards = [
    "system:serviceaccount:kube-system:efs-csi-*",
  ]
}
