################################################################################
# Understand the current AWS RDS Cluster
################################################################################
data "aws_rds_clusters" "vendorcorp" {}


locals {
  rds_clusters = length(data.aws_rds_clusters.vendorcorp.cluster_identifiers) > 0 ? [for c in data.aws_rds_clusters.vendorcorp.cluster_identifiers : c if startswith(c, "vendorcorp-")] : []
  
    # [for c in data.aws_rds_clusters.vendorcorp.cluster_identifiers : c if startswith(c, "vendorcorp-")][0] 
    # : null
}

locals {
  rds_cluster_name = length(local.rds_clusters) > 0 ? local.rds_clusters[0] : ""
}

data "aws_rds_cluster" "vendorcorp" {
  count              = length(local.rds_clusters)
  cluster_identifier = local.rds_cluster_name
}

data "aws_secretsmanager_secrets" "secrets" {
  count              = length(local.rds_clusters)
  filter {
    name   = "tag-value"
    values = [data.aws_rds_cluster.vendorcorp[0].arn]
  }
}

data "aws_secretsmanager_secret" "secret" {
  count     = length(data.aws_secretsmanager_secrets.secrets)
  arn       = [for i in data.aws_secretsmanager_secrets.secrets[0].arns : i][0]
}

data "aws_secretsmanager_secret_version" "current" {
  count     = length(data.aws_secretsmanager_secret.secret)
  secret_id = data.aws_secretsmanager_secret.secret[0].id
}