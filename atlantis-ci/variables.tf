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

variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "state_bucket" {
  type        = string
  description = "	Terraform state S3 bucket name"
}

variable "state_sku_key" {
  type        = string
  description = "Terraform state SKU key"
}

variable "resource_prefix" {
  type        = string
  description = "Default resource prefix injected by Terragrunt"
}

variable "allowed_repositories" {
  type        = list(string)
  description = "List of repositories using Atlantis"
}

variable "github_app_id" {
  type        = number
  description = "ID used for authentication and communication between Atlantis and GitHub"
}

variable "atlantis_image_tag" {
  type        = string
  description = "Atlantis version"
}

variable "default_tf_version" {
  type        = string
  description = "Default Terraform version"
}

variable "service_cpu_units" {
  type        = number
  description = "Specifies the number of CPU units allocated to the service"
}

variable "service_memory_units" {
  type        = number
  description = "Defines the amount of memory allocated for the service"
}

variable "max_parallel_jobs" {
  type        = number
  description = "Number of jobs to run at the same time"
}

variable "local_atlantis_role_arns" {
  type        = list(string)
  description = "Used by the module to generate the trust policy"
}
