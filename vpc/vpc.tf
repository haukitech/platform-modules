# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.7"

  name = var.resource_prefix + "-default"
  cidr = var.public_vpc_cidr
  secondary_cidr_blocks = [
    var.private_vpc_cidr,
  ]

  azs             = var.azs_in_use
  private_subnets = [for sub in local.private_subnets : sub["cidr"]]
  public_subnets  = [for sub in local.public_subnets : sub["cidr"]]

  enable_nat_gateway = true
  single_nat_gateway = true

  private_subnet_tags = var.private_subnet_tags
  public_subnet_tags  = var.public_subnet_tags
}