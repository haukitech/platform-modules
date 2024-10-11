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

module "atlantis" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.33.0"

  role_name         = "${var.resource_prefix}-atlantis-${var.aws_region}"
  role_description  = "Atlantis assumes this role to manage infrastructure in this account"
  create_role       = true
  role_requires_mfa = false

  trusted_role_arns = [
    var.atlantis_main_iam_role_arn,
    var.firefighters_iam_role_arn,
    data.terraform_remote_state.hauki-access.outputs.hauki_role_arn,
  ]

  custom_role_policy_arns = [
    aws_iam_policy.atlantis_access.arn,
  ]
}
