## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.46 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_atlantis"></a> [atlantis](#module\_atlantis) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.33.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.atlantis_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_document.atlantis_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [terraform_remote_state.hauki-access](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_atlantis_main_iam_role_arn"></a> [atlantis\_main\_iam\_role\_arn](#input\_atlantis\_main\_iam\_role\_arn) | Used by the module to generate the trust policy | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_firefighters_iam_role_arn"></a> [firefighters\_iam\_role\_arn](#input\_firefighters\_iam\_role\_arn) | ARN of the provisioned IAM role for the Firefighters | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Default resource prefix injected by Terragrunt | `string` | n/a | yes |
| <a name="input_state_bucket"></a> [state\_bucket](#input\_state\_bucket) | Terraform state S3 bucket name | `string` | n/a | yes |
| <a name="input_state_sku_key"></a> [state\_sku\_key](#input\_state\_sku\_key) | Terraform state SKU key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_policy_arn"></a> [access\_policy\_arn](#output\_access\_policy\_arn) | ARN of the policy granted to the created role |
| <a name="output_atlantis_role_arn"></a> [atlantis\_role\_arn](#output\_atlantis\_role\_arn) | ARN of the created IAM role |