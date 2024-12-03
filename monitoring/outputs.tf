# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

output "service_hostname" {
  value = {
    for svc in local.monitoring_services : svc => aws_route53_record.monitoring[svc].name
  }
  description = "Public hostnames for monitoring services: AlertManager, Grafana, Prometheus"
}
