/**
* # Monitoring
*
* This Terraform module creates resources needed for the components of the monitoring infrastructure:
*
* * AlertManager – for handling alerts sent by Prometheus or other services.
* * Prometheus – for storing application and infrastructure metrics, event monitoring and alerting.
* * Grafana – for managing monitoring dashboards, interactive visualisation and analytics.
*
* Monitoring services are installed and managed in the Kubernetes cluster in this repository
* https://github.com/kamu-data/kamu-cluster.
*/
terraform {
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35"
    }
  }
}
