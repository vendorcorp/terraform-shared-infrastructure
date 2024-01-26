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

data "aws_secretsmanager_secrets" "secrets" {
  filter {
    name   = "tag-value"
    values = [data.aws_rds_cluster.vendorcorp[0].arn]
  }
}

data "aws_secretsmanager_secret" "secret" {
  count     = length(data.aws_secretsmanager_secrets.secrets.arns)
  arn       = [for i in data.aws_secretsmanager_secrets.secrets.arns : i][0]
}

data "aws_secretsmanager_secret_version" "current" {
  count     = length(data.aws_secretsmanager_secret.secret)
  secret_id = data.aws_secretsmanager_secret.secret[0].id
}