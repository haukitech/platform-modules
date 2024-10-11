# Copyright 2024 Hauki Tech sp. z o.o.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

locals {
  parameter_path             = "/${replace(var.resource_prefix, "-", "/")}"
  atlantis_domain_name       = "atlantis.${data.terraform_remote_state.internal-dns.outputs.zone_name}"
  basic_auth_username_prefix = "atlantis"

  server_side_config = sensitive(jsonencode(yamldecode(file("server_side_config.yaml"))))

  private_subnet_ids = tolist(data.terraform_remote_state.vpc.outputs.private_subnets)
  public_subnet_ids  = tolist(data.terraform_remote_state.vpc.outputs.public_subnets)
}
