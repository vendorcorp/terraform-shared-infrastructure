################################################################################
# Understand the current AWS RDS Cluster
################################################################################
data "aws_rds_clusters" "vendorcorp" {}

locals {
  rds_cluster_name = length(data.aws_rds_clusters.vendorcorp.cluster_identifiers) > 0 ? [for c in data.aws_rds_clusters.vendorcorp.cluster_identifiers : c if startswith(c, "vendorcorp-")][0] : null
}

data "aws_rds_cluster" "vendorcorp" {
  count              = length(data.aws_rds_clusters.vendorcorp.cluster_identifiers)
  cluster_identifier = local.rds_cluster_name
}