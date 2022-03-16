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

output "eks_cluster_id" {
  value = data.aws_eks_cluster.vendorcorp_eks_cluster.id
}

output "eks_cluster_arn" {
  value = data.aws_eks_cluster.vendorcorp_eks_cluster.arn
}

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

output "namespace_shared_core_name" {
  value = data.kubernetes_namespace.namespace_shared_core.metadata[index(data.kubernetes_namespace.namespace_shared_core.metadata.*.name, var.default_namespace_name_shared_core)].name
}
