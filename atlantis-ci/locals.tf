# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

locals {
  parameter_path             = "/${replace(var.resource_prefix, "-", "/")}"
  atlantis_domain_name       = "atlantis.${data.terraform_remote_state.internal-dns.outputs.zone_name}"
  basic_auth_username_prefix = "atlantis"

  server_side_config = sensitive(jsonencode(yamldecode(file("server_side_config.yaml"))))

  private_subnet_ids = tolist(data.terraform_remote_state.vpc.outputs.private_subnets)
}
