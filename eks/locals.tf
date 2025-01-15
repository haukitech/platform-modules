# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

locals {
  public_subnets  = data.terraform_remote_state.default-vpc.outputs.public_subnet_ids
  private_subnets = data.terraform_remote_state.default-vpc.outputs.private_subnet_ids

  new_public_subnets  = [for _, sub in data.terraform_remote_state.default-vpc.outputs.new_public_subnets : sub]
  new_private_subnets = [for _, sub in data.terraform_remote_state.default-vpc.outputs.new_private_subnets : sub]

  vpc_id         = data.terraform_remote_state.default-vpc.outputs.vpc_id
  hauki_iam_role = data.terraform_remote_state.hauki-access.outputs.hauki_role_arn
}
