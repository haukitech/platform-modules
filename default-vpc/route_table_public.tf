# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id

  depends_on = [
    aws_vpc_ipv4_cidr_block_association.old_private,
    aws_vpc_ipv4_cidr_block_association.private,
    aws_vpc_ipv4_cidr_block_association.public,
  ]


  route {
    cidr_block = var.old_public_vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block = var.old_private_vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block = var.private_vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block = var.public_vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = var.resource_prefix + "-public"
  }
}

resource "aws_route_table_association" "old_public" {
  for_each = aws_subnet.old_public

  route_table_id = aws_route_table.public.id
  subnet_id      = each.value.id
}


resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  route_table_id = aws_route_table.public.id
  subnet_id      = each.value.id
}
