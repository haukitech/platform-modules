# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

module "atlantis_secrets" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "~> 1.1"

  for_each = {
    github-app-key = {
      secret_string = data.sops_file.secrets.data["app_key"]
    }
    github-webhook-secret = {
      secret_string = data.sops_file.secrets.data["webhook_secret"]
    }
    basic-auth-username = {
      secret_string = "${local.basic_auth_username_prefix}-${random_password.basic_auth_username_suffix.result}"
    }
    basic-auth-passwd = {
      secret_string = random_password.basic_auth_pass.result
    }
  }

  # Secret
  name          = "${local.parameter_path}/0/${each.key}"
  secret_string = each.value["secret_string"]
}

resource "random_password" "basic_auth_pass" {
  length      = 32
  special     = true
  numeric     = true
  lower       = true
  upper       = true
  min_special = 5
  min_numeric = 5
  min_lower   = 5
  min_upper   = 5
}

resource "random_password" "basic_auth_username_suffix" {
  length  = 5
  special = false
}

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}
