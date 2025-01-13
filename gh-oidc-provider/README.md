# GitHub Actions OIDC provider

This Terraform module creates an OIDC provider for GitHub Actions. It is used to
assume IAM roles directly from GitLab runners.

AWS secures connection to the IdP with its own library of trusted certificates.

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
| <a name="module_iam_github_oidc_provider"></a> [iam\_github\_oidc\_provider](#module\_iam\_github\_oidc\_provider) | terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider | 5.34.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_provider_arn"></a> [provider\_arn](#output\_provider\_arn) | ARN of the created OIDC provider |
| <a name="output_provider_url"></a> [provider\_url](#output\_provider\_url) | URL of the created OIDC provider |