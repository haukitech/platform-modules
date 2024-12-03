# Monitoring

This Terraform module creates resources needed for the components of the monitoring infrastructure:

* AlertManager – for handling alerts sent by Prometheus or other services.
* Prometheus – for storing application and infrastructure metrics, event monitoring and alerting.
* Grafana – for managing monitoring dashboards, interactive visualisation and analytics.

Monitoring services are installed and managed in the Kubernetes cluster in this repository
https://github.com/kamu-data/kamu-cluster.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.35 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [terraform_remote_state.internal-dns](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | n/a | yes |
| <a name="input_nginx_nlb_hostname"></a> [nginx\_nlb\_hostname](#input\_nginx\_nlb\_hostname) | Public hostnames for monitoring services: AlertManager, Grafana, Prometheus | `string` | n/a | yes |
| <a name="input_state_bucket"></a> [state\_bucket](#input\_state\_bucket) | Terraform state S3 bucket name | `string` | n/a | yes |
| <a name="input_state_sku_key"></a> [state\_sku\_key](#input\_state\_sku\_key) | Terraform state SKU key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_hostname"></a> [service\_hostname](#output\_service\_hostname) | Public hostnames for monitoring services: AlertManager, Grafana, Prometheus |