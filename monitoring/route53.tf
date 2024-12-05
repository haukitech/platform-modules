# Copyright 2024 Hauki Tech sp. z o.o.
# SPDX-License-Identifier: Apache-2.0

resource "aws_route53_record" "monitoring" {
  for_each = local.monitoring_services

  name    = "${each.key}.${data.terraform_remote_state.internal-dns.outputs.zone_name}"
  type    = "CNAME"
  zone_id = data.terraform_remote_state.internal-dns.outputs.zone_id
  ttl     = 30

  records = [
    var.nginx_nlb_hostname
  ]
}
