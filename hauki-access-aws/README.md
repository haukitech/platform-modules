# Hauki access

 This Terraform module allows Hauki engineers to access AWS account where it is installed.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.31 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.31 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_hauki_engineer"></a> [hauki\_engineer](#module\_hauki\_engineer) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.33.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.hauki_engineer_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_document.allow_assumption_to_hauki_external](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.hauki_engineer_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hauki_external_iam_role_arn"></a> [hauki\_external\_iam\_role\_arn](#input\_hauki\_external\_iam\_role\_arn) | ARN of the IAM role in the Hauki AWS account | `string` | n/a | yes |
| <a name="input_hauki_management_account_number"></a> [hauki\_management\_account\_number](#input\_hauki\_management\_account\_number) | Hauki AWS account | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hauki_engineer_access_policy_arn"></a> [hauki\_engineer\_access\_policy\_arn](#output\_hauki\_engineer\_access\_policy\_arn) | ARN of the policy granted to the created role |
| <a name="output_hauki_role_arn"></a> [hauki\_role\_arn](#output\_hauki\_role\_arn) | ARN of the created IAM role |