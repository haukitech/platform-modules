 # EKS

 This Terraform module creates and configures an EKS cluster for Kamu
 services.

 The access is managed with EKS API by creating access entries.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.46 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster_autoscaler_role"></a> [cluster\_autoscaler\_role](#module\_cluster\_autoscaler\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 5.34.0 |
| <a name="module_eks-main"></a> [eks-main](#module\_eks-main) | terraform-aws-modules/eks/aws | ~> 20.8 |
| <a name="module_eks_ebs_addon_iam_role"></a> [eks\_ebs\_addon\_iam\_role](#module\_eks\_ebs\_addon\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 5.34.0 |
| <a name="module_eks_efs_addon_iam_role"></a> [eks\_efs\_addon\_iam\_role](#module\_eks\_efs\_addon\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 5.34.0 |
| <a name="module_ng_default_1"></a> [ng\_default\_1](#module\_ng\_default\_1) | terraform-aws-modules/eks/aws//modules/eks-managed-node-group | >= 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [terraform_remote_state.default-vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.hauki-access](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_cluster_nodegroups"></a> [additional\_cluster\_nodegroups](#input\_additional\_cluster\_nodegroups) | Specifies additional managed node groups for the EKS | `map(any)` | `{}` | no |
| <a name="input_aws_managed_policy_eks_cluster_admin"></a> [aws\_managed\_policy\_eks\_cluster\_admin](#input\_aws\_managed\_policy\_eks\_cluster\_admin) | ARN of the EKS Cluster Admin managed policy | `string` | n/a | yes |
| <a name="input_aws_managed_policy_eks_view"></a> [aws\_managed\_policy\_eks\_view](#input\_aws\_managed\_policy\_eks\_view) | ARN of the EKS View managed policy | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_default_node_group_instance_classes"></a> [default\_node\_group\_instance\_classes](#input\_default\_node\_group\_instance\_classes) | List of the main node group instance classes | `list(string)` | n/a | yes |
| <a name="input_default_node_group_max_size"></a> [default\_node\_group\_max\_size](#input\_default\_node\_group\_max\_size) | Specifies the maximum number of instances that should be running in a node group | `number` | n/a | yes |
| <a name="input_default_node_group_min_size"></a> [default\_node\_group\_min\_size](#input\_default\_node\_group\_min\_size) | Specifies the minimum number of instances that should be running in a node group | `number` | n/a | yes |
| <a name="input_eks_version"></a> [eks\_version](#input\_eks\_version) | Version of the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_firefighters_iam_role_arn"></a> [firefighters\_iam\_role\_arn](#input\_firefighters\_iam\_role\_arn) | ARN of the provisioned IAM role for the Firefighters group in the account | `string` | n/a | yes |
| <a name="input_main_node_group_instance_classes"></a> [main\_node\_group\_instance\_classes](#input\_main\_node\_group\_instance\_classes) | Contains a list of instance types to use | `list(string)` | n/a | yes |
| <a name="input_main_node_group_max_size"></a> [main\_node\_group\_max\_size](#input\_main\_node\_group\_max\_size) | Specifies the maximum number of instances that should be running in a node group | `number` | n/a | yes |
| <a name="input_main_node_group_min_size"></a> [main\_node\_group\_min\_size](#input\_main\_node\_group\_min\_size) | Specifies the minimum number of instances that should be running in a node group | `number` | n/a | yes |
| <a name="input_readonly_user_iam_role_arn"></a> [readonly\_user\_iam\_role\_arn](#input\_readonly\_user\_iam\_role\_arn) | ARN of the provisioned IAM role for the Read-Only group in the account | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Default resource prefix injected by Terragrunt | `string` | n/a | yes |
| <a name="input_state_bucket"></a> [state\_bucket](#input\_state\_bucket) | Terraform state S3 bucket name | `string` | n/a | yes |
| <a name="input_state_sku_key"></a> [state\_sku\_key](#input\_state\_sku\_key) | Terraform state SKU key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | ARN of the EKS cluster |
| <a name="output_cluster_autoscaler_role_arn"></a> [cluster\_autoscaler\_role\_arn](#output\_cluster\_autoscaler\_role\_arn) | ARN of the IAM role for the cluster autoscaler |
| <a name="output_cluster_iam_role_arn"></a> [cluster\_iam\_role\_arn](#output\_cluster\_iam\_role\_arn) | ARN of the control plane's IAM role |
| <a name="output_cluster_oidc_provider_arn"></a> [cluster\_oidc\_provider\_arn](#output\_cluster\_oidc\_provider\_arn) | ARN of the cluster's OIDC provider |
| <a name="output_cluster_oidc_provider_url"></a> [cluster\_oidc\_provider\_url](#output\_cluster\_oidc\_provider\_url) | URL of the cluster's OIDC provider |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | ID of the control plane's security group |
| <a name="output_node_security_group_arn"></a> [node\_security\_group\_arn](#output\_node\_security\_group\_arn) | ARN of the node security group |
| <a name="output_node_security_group_id"></a> [node\_security\_group\_id](#output\_node\_security\_group\_id) | ID of the node security group |