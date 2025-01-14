# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

module "eks-main" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.8"

  cluster_name    = var.resource_prefix-main
  cluster_version = var.eks_version


  vpc_id = local.vpc_id
  control_plane_subnet_ids = flatten([
    local.public_subnets,
    local.private_subnets,
    local.new_private_subnets,
    local.new_public_subnets,
  ])

  enable_irsa                              = true
  cluster_endpoint_public_access           = true
  enable_cluster_creator_admin_permissions = false
  authentication_mode                      = "API"

  kms_key_administrators = [
    var.firefighters_iam_role_arn,
    local.hauki_iam_role,
  ]

  # To find a list of available cluster addons see
  # https://docs.aws.amazon.com/eks/latest/userguide/managing-add-ons.html
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    aws-ebs-csi-driver = {
      most_recent              = true
      service_account_role_arn = module.eks_ebs_addon_iam_role.iam_role_arn
    }
    aws-efs-csi-driver = {
      most_recent              = true
      service_account_role_arn = module.eks_efs_addon_iam_role.iam_role_arn
    }
  }

  cluster_encryption_policy_use_name_prefix = false
  cluster_security_group_use_name_prefix    = false
  iam_role_use_name_prefix                  = false
  node_security_group_use_name_prefix       = false

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types           = var.default_node_group_instance_classes
    use_name_prefix          = false
    iam_role_use_name_prefix = false
    capacity_type            = "ON_DEMAND"
  }

  eks_managed_node_groups = var.additional_cluster_nodegroups

  # Access control entries
  access_entries = {
    hauki = {
      principal_arn     = local.hauki_iam_role
      kubernetes_groups = ["hauki-engineers"]

      policy_associations = {
        eksadmin = {
          policy_arn = var.aws_managed_policy_eks_cluster_admin
          access_scope = {
            namespaces = []
            type       = "cluster"
          }
        }
      }
    }

    firefighters = {
      principal_arn     = var.firefighters_iam_role_arn
      kubernetes_groups = ["firefighters"]

      policy_associations = {
        eksadmin = {
          policy_arn = var.aws_managed_policy_eks_cluster_admin
          access_scope = {
            namespaces = []
            type       = "cluster"
          }
        }
      }
    }

    read_only = {
      principal_arn     = var.readonly_user_iam_role_arn
      kubernetes_groups = ["read-only"]

      policy_associations = {
        eksview = {
          policy_arn = var.aws_managed_policy_eks_view
          access_scope = {
            namespaces = []
            type       = "cluster"
          }
        }
      }
    }
  }
}
