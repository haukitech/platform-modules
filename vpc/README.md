# VPC

This module configures basic VPC for running all services, including:

* Public and private networks
* NAT gateway
* Internet gateway

All resources are configured to use multiple availability zones for high availability.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.46 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.7 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs_in_use"></a> [azs\_in\_use](#input\_azs\_in\_use) | List of the availability zones in use | `list(string)` | n/a | yes |
| <a name="input_private_subnet_tags"></a> [private\_subnet\_tags](#input\_private\_subnet\_tags) | Tags for private subnet | `map(string)` | n/a | yes |
| <a name="input_private_vpc_cidr"></a> [private\_vpc\_cidr](#input\_private\_vpc\_cidr) | CIDR block for private subnets | `string` | n/a | yes |
| <a name="input_public_subnet_tags"></a> [public\_subnet\_tags](#input\_public\_subnet\_tags) | Tags for public subnet | `map(string)` | n/a | yes |
| <a name="input_public_vpc_cidr"></a> [public\_vpc\_cidr](#input\_public\_vpc\_cidr) | CIDR block for public subnets | `string` | n/a | yes |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Resource prefix | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azs_in_use"></a> [azs\_in\_use](#output\_azs\_in\_use) | List of Availability Zones (AZs) in use for creating subnets within the VPC |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | CIDR blocks for private subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | CIDR blocks for public subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC |