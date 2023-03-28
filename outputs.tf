################################################################################
# AWS Networking Data
################################################################################
output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "vpc_cidr" {
  value = data.aws_vpc.selected.cidr_block
}

output "public_subnet_ids" {
  value = data.aws_subnets.public.ids
}

output "public_subnet_ids_az_map" {
  value = { for k, v in data.aws_subnet.public : v.availability_zone => k }
}

output "private_subnet_ids" {
  value = data.aws_subnets.private.ids
}

output "private_subnet_ids_az_map" {
  value = { for k, v in data.aws_subnet.private : v.availability_zone => k }
}

output "public_subnet_cidrs" {
  value = [for s in data.aws_subnet.public : s.cidr_block]
}

output "private_subnet_cidrs" {
  value = [for s in data.aws_subnet.private : s.cidr_block]
}

################################################################################
# AWS EKS Data
################################################################################
output "eks_cluster_id" {
  value = data.aws_eks_cluster.vendorcorp_eks_cluster.id
}

output "eks_cluster_arn" {
  value = data.aws_eks_cluster.vendorcorp_eks_cluster.arn
}

output "eks_cluster_security_group_id" {
  value = data.aws_eks_cluster.vendorcorp_eks_cluster.vpc_config[0].cluster_security_group_id
}

output "eks_cluster_oidc_issuer" {
  value = data.aws_eks_cluster.vendorcorp_eks_cluster.identity[0].oidc[0].issuer
}

output "eks_cluster_oidc_provider_arn" {
  value = data.aws_iam_openid_connect_provider.vendorcorp_eks_cluster_oidc.arn
}

################################################################################
# AWS Route53 (DNS) Data
################################################################################
output "dns_zone_internal_id" {
  value = data.aws_route53_zone.zone_vendorcorp_internal.zone_id
}

output "dns_zone_internal_arn" {
  value = data.aws_route53_zone.zone_vendorcorp_internal.arn
}

output "dns_zone_internal_name" {
  value = data.aws_route53_zone.zone_vendorcorp_internal.name
}

output "dns_zone_public_id" {
  value = data.aws_route53_zone.zone_vendorcorp_public.zone_id
}

output "dns_zone_public_arn" {
  value = data.aws_route53_zone.zone_vendorcorp_public.arn
}

output "dns_zone_public_name" {
  value = data.aws_route53_zone.zone_vendorcorp_public.name
}

################################################################################
# AWS Certificate Data
################################################################################
output "vendorcorp_net_cert_arn" {
  value = data.aws_acm_certificate.vendorcorp.arn
}

################################################################################
# Amazonn RDS (for PostgreSQL) Data
################################################################################
output "pgsql_cluster_arn" {
  value = data.aws_rds_cluster.postgres.arn
}

output "pgsql_cluster_endpoint_read" {
  value = data.aws_rds_cluster.postgres.reader_endpoint
}

output "pgsql_cluster_endpoint_write" {
  value = data.aws_rds_cluster.postgres.endpoint
}

output "pgsql_cluster_master_username" {
  value = data.aws_rds_cluster.postgres.master_username
}

output "pgsql_cluster_port" {
  value = data.aws_rds_cluster.postgres.port
}

################################################################################
# Kubernetes Data
################################################################################
output "namespace_shared_core_name" {
  value = data.kubernetes_namespace.namespace_shared_core.metadata[index(data.kubernetes_namespace.namespace_shared_core.metadata.*.name, var.default_namespace_name_shared_core)].name
}
