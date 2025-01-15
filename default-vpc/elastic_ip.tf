# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_eip" "nat_gw" {
  domain = "vpc"
}
