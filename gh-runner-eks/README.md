# Authentication for GitHub runners for EKS

 This Terraform module creates and configures an IAM role that can be assumed
 by GitHub runners using GitHub OIDC provider.

 Created IAM role is granted one of the following access policies:

 * `arn:aws:eks::aws:cluster-access-policy/AmazonEKSEditPolicy` for roles that
   are not cluster administrators, i.e., `is_cluster_admin` is set to `false`.
   The scope of this access policy if set to specified namespaces.
 * `arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy` for roles
   that are cluster administrators. The scope of this policy if the entire cluster.
   Cluster administrator role must only be created for cluster management purposes.

 For details about access policies please follow to the official guide:
 https://docs.aws.amazon.com/eks/latest/userguide/access-policies.html

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.38 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github_worker_role"></a> [github\_worker\_role](#module\_github\_worker\_role) | terraform-aws-modules/iam/aws//modules/iam-github-oidc-role | 5.34.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_access_entry.github_runner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_entry) | resource |
| [aws_eks_access_policy_association.github_runner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_policy_association) | resource |
| [aws_iam_policy.github_runner_eks_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.github_runner_kms_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_kms_alias.secrets_sops](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.secrets_sops](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_eks_cluster.target_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_policy_document.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_managed_policy_eks_cluster_admin"></a> [aws\_managed\_policy\_eks\_cluster\_admin](#input\_aws\_managed\_policy\_eks\_cluster\_admin) | ARN of the EKS Cluster Admin managed policy | `string` | n/a | yes |
| <a name="input_aws_managed_policy_eks_edit"></a> [aws\_managed\_policy\_eks\_edit](#input\_aws\_managed\_policy\_eks\_edit) | ARN of the policy to edit EKS | `string` | n/a | yes |
| <a name="input_deploy_namespaces"></a> [deploy\_namespaces](#input\_deploy\_namespaces) | List of namespaces the role will be given access to | `list(string)` | `[]` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | The name of the EKS cluster. | `string` | n/a | yes |
| <a name="input_github_repositories"></a> [github\_repositories](#input\_github\_repositories) | Repositories where actions will be running. must be in `username/repository` format | `list(string)` | n/a | yes |
| <a name="input_is_cluster_admin"></a> [is\_cluster\_admin](#input\_is\_cluster\_admin) | Designates whether the IAM role must be granted administrator-level access for the entire cluster | `bool` | `false` | no |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Default resource prefix injected by Terragrunt | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_kms_key_id"></a> [aws\_kms\_key\_id](#output\_aws\_kms\_key\_id) | ID of the created KMS key for encrypting secrets |
| <a name="output_kms_key_alias"></a> [kms\_key\_alias](#output\_kms\_key\_alias) | Alias of the created KMS key for encrypting secrets |
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | ARN of the created KMS key for encrypting secrets |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN of the IAM role for GitHub worker |