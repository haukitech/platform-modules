# Internal DNS

This Terraform module creates a hosted zone for the internal services
within the SKU. The zone name is `<SKU>.<ENVIRONMENT>.internal.kamu.dev`
where `kamu.dev` is the name of the rood DNS zone configurable by variables.

   Note: The module does not create any records in the rood zone.
         NS and DS records have to be managed there independently.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.35 |
| <a name="provider_aws.us-east-1"></a> [aws.us-east-1](#provider\_aws.us-east-1) | ~> 5.35 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.signing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.signing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.signing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_route53_delegation_set.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_delegation_set) | resource |
| [aws_route53_hosted_zone_dnssec.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_hosted_zone_dnssec) | resource |
| [aws_route53_key_signing_key.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_key_signing_key) | resource |
| [aws_route53_zone.internal](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_iam_policy_document.signing_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account number | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default resource tags injected by Terragrunt | `map(string)` | n/a | yes |
| <a name="input_env_code"></a> [env\_code](#input\_env\_code) | Default the environment code | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Default resource prefix injected by Terragrunt | `string` | n/a | yes |
| <a name="input_root_dns_zone"></a> [root\_dns\_zone](#input\_root\_dns\_zone) | Default to store root DNS zone name | `string` | n/a | yes |
| <a name="input_sku_code"></a> [sku\_code](#input\_sku\_code) | Default the SKU code | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_delegation_set_arn"></a> [delegation\_set\_arn](#output\_delegation\_set\_arn) | ARN of the created delegation set |
| <a name="output_delegation_set_id"></a> [delegation\_set\_id](#output\_delegation\_set\_id) | ID of the created delegation set |
| <a name="output_ds_record"></a> [ds\_record](#output\_ds\_record) | DS record to add to the parent zone to establish the chain of trust |
| <a name="output_nameservers"></a> [nameservers](#output\_nameservers) | List of nameservers for the zone |
| <a name="output_zone_arn"></a> [zone\_arn](#output\_zone\_arn) | ARN of the created hosted zone |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | ID of the created hosted zone |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | Zone fully qualified domain name |