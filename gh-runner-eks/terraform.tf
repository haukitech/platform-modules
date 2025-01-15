/**
* # Authentication for GitHub runners for EKS
*
*  This Terraform module creates and configures an IAM role that can be assumed
*  by GitHub runners using GitHub OIDC provider.
*
*  Created IAM role is granted one of the following access policies:
*
*  * `arn:aws:eks::aws:cluster-access-policy/AmazonEKSEditPolicy` for roles that
*    are not cluster administrators, i.e., `is_cluster_admin` is set to `false`.
*    The scope of this access policy if set to specified namespaces.
*  * `arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy` for roles
*    that are cluster administrators. The scope of this policy if the entire cluster.
*    Cluster administrator role must only be created for cluster management purposes.
*
*  For details about access policies please follow to the official guide:
*  https://docs.aws.amazon.com/eks/latest/userguide/access-policies.html
*/
terraform {
  required_version = ">= 1.0.0"
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.38"
    }
  }
}
