# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "resource_prefix" {
  type        = string
  description = "Default resource prefix injected by Terragrunt"
}

variable "state_bucket" {
  type        = string
  description = "Terraform state S3 bucket name"
}

variable "state_sku_key" {
  type        = string
  description = "Terraform state SKU key"
}

variable "eks_version" {
  type        = string
  description = "Version of the Kubernetes cluster"
}

variable "main_node_group_instance_classes" {
  type        = list(string)
  description = "Contains a list of instance types to use"
}

variable "main_node_group_min_size" {
  type        = number
  description = "Specifies the minimum number of instances that should be running in a node group"
}

variable "main_node_group_max_size" {
  type        = number
  description = "Specifies the maximum number of instances that should be running in a node group"
}


variable "default_node_group_instance_classes" {
  type        = list(string)
  description = "List of the main node group instance classes"
}

variable "default_node_group_min_size" {
  type        = number
  description = "Specifies the minimum number of instances that should be running in a node group"
}

variable "default_node_group_max_size" {
  type        = number
  description = "Specifies the maximum number of instances that should be running in a node group"
}

variable "firefighters_iam_role_arn" {
  type        = string
  description = "ARN of the provisioned IAM role for the Firefighters group in the account"
}

variable "readonly_user_iam_role_arn" {
  type        = string
  description = "ARN of the provisioned IAM role for the Read-Only group in the account"
}

variable "aws_managed_policy_eks_cluster_admin" {
  type        = string
  description = "ARN of the EKS Cluster Admin managed policy"
}

variable "aws_managed_policy_eks_view" {
  type        = string
  description = "ARN of the EKS View managed policy"
}

variable "aws_account_id" {
  type        = string
  description = "AWS account"
}

variable "additional_cluster_nodegroups" {
  type        = map(any)
  default     = {}
  description = "Specifies additional managed node groups for the EKS"
}
