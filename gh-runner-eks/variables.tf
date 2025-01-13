# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

variable "resource_prefix" {
  type        = string
  description = "Default resource prefix injected by Terragrunt"
}

variable "github_repositories" {
  type        = list(string)
  description = "Repositories where actions will be running. must be in `username/repository` format"
}

variable "eks_cluster_name" {
  type        = string
  description = "The name of the EKS cluster."
}

variable "is_cluster_admin" {
  type        = bool
  default     = false
  description = "Designates whether the IAM role must be granted administrator-level access for the entire cluster"
}

variable "deploy_namespaces" {
  type        = list(string)
  default     = []
  description = "List of namespaces the role will be given access to"
}

variable "aws_managed_policy_eks_edit" {
  type        = string
  description = "ARN of the policy to edit EKS"
}

variable "aws_managed_policy_eks_cluster_admin" {
  type        = string
  description = "ARN of the EKS Cluster Admin managed policy"
}
