# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_nat_gateway" "default" {
  subnet_id         = aws_subnet.old_public[var.nat_gw_public_az_id].id
  allocation_id     = aws_eip.nat_gw.id
  connectivity_type = "public"

  tags = {
    Name = var.resource_prefix + "-default"
  }
}
