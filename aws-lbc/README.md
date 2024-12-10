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

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ng_default_1"></a> [ng\_default\_1](#module\_ng\_default\_1) | terraform-aws-modules/eks/aws//modules/eks-managed-node-group | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.eks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_policy_json"></a> [policy\_json](#input\_policy\_json) | JSON-encoded policy that will be attached to the IRSA IAM role | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Resource prefix | `string` | n/a | yes |
| <a name="input_state_bucket"></a> [state\_bucket](#input\_state\_bucket) | Terraform state S3 bucket name | `string` | n/a | yes |
| <a name="input_state_sku_key"></a> [state\_sku\_key](#input\_state\_sku\_key) | Terraform state SKU key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of the created IRSA IAM role for AWS LBC |