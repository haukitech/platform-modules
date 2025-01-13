# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

variable "hauki_external_iam_role_arn" {
  type        = string
  description = "ARN of the IAM role in the Hauki AWS account"
}

variable "hauki_management_account_number" {
  type        = string
  description = "Hauki AWS account"
}
