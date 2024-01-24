################################################################################
# Understand the current AWS RDS Cluster
################################################################################
data "aws_rds_clusters" "vendorcorp" {}

locals {
  rds_cluster_name = [for c in data.aws_rds_clusters.vendorcorp.cluster_identifiers : c if startswith(c, "vendorcorp-")][0]
}

data "aws_rds_cluster" "vendorcorp" {
  cluster_identifier = local.rds_cluster_name
}