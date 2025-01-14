# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

data "terraform_remote_state" "default-vpc" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = var.state_sku_key / default-vpc / terraform.tfstate
    region = var.aws_region
  }
}

data "terraform_remote_state" "hauki-access" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = var.state_sku_key / hauki-access / terraform.tfstate
    region = var.aws_region
  }
}
