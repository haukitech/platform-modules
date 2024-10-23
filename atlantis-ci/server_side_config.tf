# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

module "server_side_config" {
  source  = "terraform-aws-modules/ssm-parameter/aws"
  version = "~> 1.1"

  name = "${local.parameter_path}/0/server-configuration"
  type = "String"

  value = local.server_side_config
}
