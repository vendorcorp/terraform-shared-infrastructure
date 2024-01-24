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
  value = data.aws_rds_cluster.vendorcorp.arn
}

output "pgsql_cluster_endpoint_read" {
  value = data.aws_rds_cluster.vendorcorp.reader_endpoint
}

output "pgsql_cluster_endpoint_write" {
  value = data.aws_rds_cluster.vendorcorp.endpoint
}

output "pgsql_cluster_master_username" {
  value = data.aws_rds_cluster.vendorcorp.master_username
}

output "pgsql_cluster_port" {
  value = data.aws_rds_cluster.vendorcorp.port
}