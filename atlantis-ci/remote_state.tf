# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

data "terraform_remote_state" "internal-dns" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = "${var.state_sku_key}/internal-dns/terraform.tfstate"
    region = var.aws_region
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = "${var.state_sku_key}/vpc/terraform.tfstate"
    region = var.aws_region
  }
}
