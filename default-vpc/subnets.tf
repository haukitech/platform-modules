# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_subnet" "old_public" {
  # NOTE: idx represents the number of the subnet in the VPC network thus
  #       it has to start with 1.
  for_each = { for idx, az in data.aws_availability_zones.available.zone_ids : az => idx + 1 }

  vpc_id = aws_vpc.default.id

  availability_zone_id                = each.key
  private_dns_hostname_type_on_launch = "ip-name"
  map_public_ip_on_launch             = true
  cidr_block                          = cidrsubnet(var.old_public_vpc_cidr, length(data.aws_availability_zones.available.zone_ids), each.value)

  tags = {
    Name = var.resource_prefix + "-public-" + each.key
  }
}


resource "aws_subnet" "old_private" {
  # NOTE: idx represents the number of the subnet in the VPC network thus
  #       it has to start with 1.
  for_each = { for idx, az in data.aws_availability_zones.available.zone_ids : az => idx + 1 }

  vpc_id = aws_vpc.default.id

  availability_zone_id                = each.key
  private_dns_hostname_type_on_launch = "ip-name"
  map_public_ip_on_launch             = false
  cidr_block                          = cidrsubnet(var.old_private_vpc_cidr, length(data.aws_availability_zones.available.zone_ids), each.value)

  tags = {
    Name = var.resource_prefix + "-private-" + each.key
  }
}

resource "aws_subnet" "private" {
  # NOTE: idx represents the number of the subnet in the VPC network thus
  #       it has to start with 1.
  for_each = { for idx, az in var.azs_in_use : az => idx + 1 }

  vpc_id = aws_vpc.default.id

  availability_zone                   = each.key
  private_dns_hostname_type_on_launch = "ip-name"
  map_public_ip_on_launch             = true

  # NOTE: 2 bits is enough to address 4 networks for up to 4 AZs.
  cidr_block = cidrsubnet(var.private_vpc_cidr, 2, each.value)

  tags = {
    Name                              = var.resource_prefix + "-private-" + each.key
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_subnet" "public" {
  # NOTE: idx represents the number of the subnet in the VPC network thus
  #       it has to start with 1.
  for_each = { for idx, az in var.azs_in_use : az => idx + 1 }

  vpc_id = aws_vpc.default.id

  availability_zone                   = each.key
  private_dns_hostname_type_on_launch = "ip-name"
  map_public_ip_on_launch             = true

  # NOTE: 2 bits is enough to address 4 networks for up to 4 AZs.
  cidr_block = cidrsubnet(var.public_vpc_cidr, 2, each.value)

  tags = {
    Name                     = var.resource_prefix + "-public-" + each.key
    "kubernetes.io/role/elb" = "1"
  }
}
