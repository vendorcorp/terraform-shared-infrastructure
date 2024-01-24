################################################################################
# Understand the current EKS Cluster
################################################################################
data "aws_eks_clusters" "vendorcorp" {}

locals {
  cluster_name = [for c in data.aws_eks_clusters.vendorcorp.names : c if startswith(c, "vendorcorp-")][0]
}

data "aws_eks_cluster" "vendorcorp" {
    name = local.cluster_name
}

data "aws_iam_openid_connect_provider" "vendorcorp" {
  url = data.aws_eks_cluster.vendorcorp.identity[0].oidc[0].issuer
}