# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

locals {
  public_zone_fqdn = "${var.public_zone_name}.${var.root_dns_zone}"
}
