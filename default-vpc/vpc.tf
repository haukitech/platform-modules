# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_vpc" "default" {
  cidr_block = var.old_public_vpc_cidr

  tags = {
    Name = var.resource_prefix + "-default"
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "old_private" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.old_private_vpc_cidr
}

resource "aws_vpc_ipv4_cidr_block_association" "private" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.private_vpc_cidr
}

resource "aws_vpc_ipv4_cidr_block_association" "public" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.public_vpc_cidr
}
