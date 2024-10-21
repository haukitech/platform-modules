# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

data "sops_file" "secrets" {
  source_file = "secrets.enc.yaml"
}

data "aws_subnet" "private" {
  for_each = toset(local.private_subnet_ids)

  filter {
    name   = "subnet-id"
    values = [each.value]
  }
}

data "aws_subnet" "public" {
  for_each = toset(local.public_subnet_ids)

  filter {
    name   = "subnet-id"
    values = [each.value]
  }
}
