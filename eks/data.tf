# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

data "aws_subnets" "private" {
  filter {
    name   = "subnet-id"
    values = local.private_subnets
  }
}
