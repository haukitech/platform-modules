# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

module "atlantis" {
  source = "terraform-aws-modules/atlantis/aws"

  name    = "${var.resource_prefix}-atlantis-ci-0"
  version = "~> 4.3"

  # ECS Container Definition
  atlantis = {
    image = "ghcr.io/kamu-data/atlantis-custom-image:${var.atlantis_image_tag}"

    cpu    = var.service_cpu_units
    memory = var.service_memory_units

    environment = [
      {
        name  = "ATLANTIS_REPO_ALLOWLIST"
        value = join(",", var.allowed_repositories)
      },
      {
        name  = "ATLANTIS_WRITE_GIT_CREDS"
        value = "true"
      },
      {
        name  = "ATLANTIS_GH_APP_ID"
        value = "${var.github_app_id}"
      },
      {
        name  = "ATLANTIS_WEB_BASIC_AUTH"
        value = "true"
      },
      {
        name  = "ATLANTIS_PARALLEL_POOL_SIZE"
        value = "${var.max_parallel_jobs}"
      },
      {
        name  = "ATLANTIS_DEFAULT_TF_VERSION"
        value = var.default_tf_version
      },
      # This environment variable is needed to restart the service whenever the configuration changes
      {
        name  = "CONFIG_CHECKSUM"
        value = nonsensitive(sha1(local.server_side_config))
      },
    ]
    secrets = [
      {
        name      = "ATLANTIS_GH_APP_KEY"
        valueFrom = module.atlantis_secrets["github-app-key"].secret_arn
      },
      {
        name      = "ATLANTIS_GH_WEBHOOK_SECRET"
        valueFrom = module.atlantis_secrets["github-webhook-secret"].secret_arn
      },
      {
        name      = "ATLANTIS_WEB_USERNAME"
        valueFrom = module.atlantis_secrets["basic-auth-username"].secret_arn
      },
      {
        name      = "ATLANTIS_WEB_PASSWORD"
        valueFrom = module.atlantis_secrets["basic-auth-passwd"].secret_arn
      },
      {
        name      = "ATLANTIS_REPO_CONFIG_JSON"
        valueFrom = module.server_side_config.ssm_parameter_arn
      },
    ]
  }

  # ECS Service
  service = {
    cpu    = var.service_cpu_units
    memory = var.service_memory_units

    task_exec_iam_role_name            = "${var.resource_prefix}-execution-role-${var.aws_region}"
    task_exec_iam_role_use_name_prefix = false
    task_exec_iam_role_description     = "Execution role for Atlantis CI."

    tasks_iam_role_name            = "${var.resource_prefix}-main-role-${var.aws_region}"
    tasks_iam_role_use_name_prefix = false
    tasks_iam_role_description     = "Main IAM role of Atlantis CI. It assumes local admin roles in every managed account."


    task_exec_secret_arns = [for sec in module.atlantis_secrets : sec.secret_arn]

    # Provide Atlantis permission necessary to create/destroy resources
    tasks_iam_role_policies = {
      assume_local_account_roles = aws_iam_policy.assume_local_account_roles.arn
    }

  }

  service_subnets = data.terraform_remote_state.vpc.outputs.private_subnets
  vpc_id          = data.terraform_remote_state.vpc.outputs.vpc_id

  # ALB
  alb_subnets             = data.terraform_remote_state.vpc.outputs.public_subnets
  certificate_domain_name = local.atlantis_domain_name
  route53_record_name     = "atlantis"
  route53_zone_id         = data.terraform_remote_state.internal-dns.outputs.zone_id

  # EFS
  enable_efs = true
  efs = {
    mount_targets = { for sub in data.aws_subnet.private :
      sub.availability_zone => {
        subnet_id = sub.id
      }
    }
  }

}
