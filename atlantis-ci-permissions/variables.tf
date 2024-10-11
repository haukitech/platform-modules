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

variable "atlantis_main_iam_role_arn" {
  type        = string
  description = "Used by the module to generate the trust policy"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "state_bucket" {
  type        = string
  description = "Terraform state S3 bucket name"
}

variable "state_sku_key" {
  type        = string
  description = "Terraform state SKU key"
}

variable "firefighters_iam_role_arn" {
  type        = string
  description = "ARN of the provisioned IAM role for the Firefighters"
}

variable "resource_prefix" {
  type        = string
  description = "Default resource prefix injected by Terragrunt"
}
