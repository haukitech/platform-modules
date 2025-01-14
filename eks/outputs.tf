# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "cluster_oidc_provider_arn" {
  value       = module.eks-main.oidc_provider_arn
  description = "ARN of the cluster's OIDC provider"
}

output "cluster_oidc_provider_url" {
  value       = module.eks-main.oidc_provider
  description = "URL of the cluster's OIDC provider"
}

output "cluster_arn" {
  value       = module.eks-main.cluster_arn
  description = "ARN of the EKS cluster"
}

output "cluster_security_group_id" {
  value       = module.eks-main.cluster_security_group_id
  description = "ID of the control plane's security group"
}

output "cluster_iam_role_arn" {
  value       = module.eks-main.cluster_iam_role_arn
  description = "ARN of the control plane's IAM role"
}

output "node_security_group_id" {
  value       = module.eks-main.node_security_group_id
  description = "ID of the node security group"
}

output "node_security_group_arn" {
  value       = module.eks-main.node_security_group_arn
  description = "ARN of the node security group"
}

output "cluster_autoscaler_role_arn" {
  value       = module.cluster_autoscaler_role.iam_role_arn
  description = "ARN of the IAM role for the cluster autoscaler"
}
