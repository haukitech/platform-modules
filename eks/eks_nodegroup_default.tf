# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

module "ng_default_1" {
  source   = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version  = ">= 1.0.0"
  for_each = data.terraform_remote_state.default-vpc.outputs.new_private_subnets

  name            = var.resource_prefix + "-ng-default-1-" + each.key
  use_name_prefix = false

  cluster_name    = module.eks-main.cluster_name
  cluster_version = module.eks-main.cluster_version
  subnet_ids = [
    each.value,
  ]

  cluster_service_cidr              = module.eks-main.cluster_service_cidr
  cluster_primary_security_group_id = module.eks-main.cluster_primary_security_group_id
  vpc_security_group_ids            = [module.eks-main.node_security_group_id]

  min_size     = var.default_node_group_min_size
  max_size     = var.default_node_group_max_size
  desired_size = var.default_node_group_min_size

  iam_role_name            = var.resource_prefix + "-ng-default-1-role-" + each.key
  iam_role_use_name_prefix = false

  launch_template_name            = var.resource_prefix + "-ng-default-1-" + each.key
  launch_template_use_name_prefix = false

  instance_types = var.main_node_group_instance_classes
  capacity_type  = "ON_DEMAND"

  update_config = {
    max_unavailable_percentage = 25
  }

  block_device_mappings = {
    xvda = {
      device_name = "/dev/xvda"
      ebs = {
        volume_size           = 40
        volume_type           = "gp2"
        delete_on_termination = true
      }
    }
  }

  labels = {
    group = "default"
  }

  tags = {
    cluster_name = module.eks-main.cluster_name
  }
}
