# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.default.id

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
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.default.id
  }

  tags = {
    Name = var.resource_prefix + "-private"
  }
}

resource "aws_route_table_association" "old_private" {
  for_each = aws_subnet.old_private

  route_table_id = aws_route_table.private.id
  subnet_id      = each.value.id
}

resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private

  route_table_id = aws_route_table.private.id
  subnet_id      = each.value.id
}
