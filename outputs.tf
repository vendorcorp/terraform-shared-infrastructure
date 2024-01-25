################################################################################
# AWS EKS Cluster
################################################################################
output "eks_cluster_id" {
  value = data.aws_eks_cluster.vendorcorp.id
}

output "eks_cluster_arn" {
  value = data.aws_eks_cluster.vendorcorp.arn
}

output "eks_cluster_security_group_id" {
  value = data.aws_eks_cluster.vendorcorp.vpc_config[0].cluster_security_group_id
}

output "eks_cluster_oidc_issuer" {
  value = data.aws_eks_cluster.vendorcorp.identity[0].oidc[0].issuer
}

output "eks_cluster_oidc_provider_arn" {
  value = data.aws_iam_openid_connect_provider.vendorcorp.arn
}

################################################################################
# AWS RDS Cluster
################################################################################
output "pgsql_cluster_arn" {
  value = length(data.aws_rds_cluster.vendorcorp) > 0 ? data.aws_rds_cluster.vendorcorp[0].arn : null
}

output "pgsql_cluster_endpoint_read" {
  value = length(data.aws_rds_cluster.vendorcorp) > 0 ? data.aws_rds_cluster.vendorcorp[0].reader_endpoint : null
}

output "pgsql_cluster_endpoint_write" {
  value = length(data.aws_rds_cluster.vendorcorp) > 0 ? data.aws_rds_cluster.vendorcorp[0].endpoint : null
}

output "pgsql_cluster_master_username" {
  value = length(data.aws_rds_cluster.vendorcorp) > 0 ? data.aws_rds_cluster.vendorcorp[0].master_username : null
}

output "pgsql_cluster_port" {
  value = length(data.aws_rds_cluster.vendorcorp) > 0 ? data.aws_rds_cluster.vendorcorp[0].port : null
}