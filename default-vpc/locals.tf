# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

locals {
  private_subnets = [
    for idx, az in var.azs_in_use : {
      az   = az
      cidr = cidrsubnet(var.private_vpc_cidr, 2, idx + 1)
    }
  ]
}
