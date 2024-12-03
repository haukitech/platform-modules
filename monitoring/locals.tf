# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

locals {
  monitoring_services = toset([
    "grafana",
    "prometheus",
    "alertmanager"
  ])
}
