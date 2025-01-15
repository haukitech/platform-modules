# AWS Load Balancer Controller

This Terraform module creates resources needed for the
AWS Load Balancer Controller.

AWS Load Balancer Controller is installed and managed in the Kubernetes cluster
in this repository https://github.com/kamu-data/kamu-cluster.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.35 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ng_default_1"></a> [ng\_default\_1](#module\_ng\_default\_1) | terraform-aws-modules/eks/aws//modules/eks-managed-node-group | >= 1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Resource prefix | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of the created IRSA IAM role for AWS LBC |