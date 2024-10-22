# Atlantis CI

This Terraform module sets up Atlantis CI running as an ECS service on Fargate.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.46 |
| <a name="requirement_sops"></a> [sops](#requirement\_sops) | 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.46 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_sops"></a> [sops](#provider\_sops) | 1.0.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_atlantis"></a> [atlantis](#module\_atlantis) | terraform-aws-modules/atlantis/aws | ~> 4.3 |
| <a name="module_atlantis_secrets"></a> [atlantis\_secrets](#module\_atlantis\_secrets) | terraform-aws-modules/secrets-manager/aws | ~> 1.1 |
| <a name="module_server_side_config"></a> [server\_side\_config](#module\_server\_side\_config) | terraform-aws-modules/ssm-parameter/aws | ~> 1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.assume_local_account_roles](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [random_password.basic_auth_pass](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.basic_auth_username_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_iam_policy_document.assume_local_account_roles](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [sops_file.secrets](https://registry.terraform.io/providers/carlpett/sops/1.0.0/docs/data-sources/file) | data source |
| [terraform_remote_state.internal-dns](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_repositories"></a> [allowed\_repositories](#input\_allowed\_repositories) | List of repositories using Atlantis | `list(string)` | n/a | yes |
| <a name="input_atlantis_image_tag"></a> [atlantis\_image\_tag](#input\_atlantis\_image\_tag) | Atlantis version | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_default_tf_version"></a> [default\_tf\_version](#input\_default\_tf\_version) | Default Terraform version | `string` | n/a | yes |
| <a name="input_github_app_id"></a> [github\_app\_id](#input\_github\_app\_id) | ID used for authentication and communication between Atlantis and GitHub | `number` | n/a | yes |
| <a name="input_local_atlantis_role_arns"></a> [local\_atlantis\_role\_arns](#input\_local\_atlantis\_role\_arns) | Used by the module to generate the trust policy | `list(string)` | n/a | yes |
| <a name="input_max_parallel_jobs"></a> [max\_parallel\_jobs](#input\_max\_parallel\_jobs) | Number of jobs to run at the same time | `number` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Default resource prefix injected by Terragrunt | `string` | n/a | yes |
| <a name="input_service_cpu_units"></a> [service\_cpu\_units](#input\_service\_cpu\_units) | Specifies the number of CPU units allocated to the service | `number` | n/a | yes |
| <a name="input_service_memory_units"></a> [service\_memory\_units](#input\_service\_memory\_units) | Defines the amount of memory allocated for the service | `number` | n/a | yes |
| <a name="input_state_bucket"></a> [state\_bucket](#input\_state\_bucket) | Terraform state S3 bucket name | `string` | n/a | yes |
| <a name="input_state_sku_key"></a> [state\_sku\_key](#input\_state\_sku\_key) | Terraform state SKU key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_atlantis_public_url"></a> [atlantis\_public\_url](#output\_atlantis\_public\_url) | URL for public access to Atlantis |
| <a name="output_basic_auth_pass"></a> [basic\_auth\_pass](#output\_basic\_auth\_pass) | Generated random password |
| <a name="output_basic_auth_username"></a> [basic\_auth\_username](#output\_basic\_auth\_username) | Generated username for basic authentication |
| <a name="output_main_atlantis_role_arn"></a> [main\_atlantis\_role\_arn](#output\_main\_atlantis\_role\_arn) | ARN of the IAM role used by the Atlantis service |
