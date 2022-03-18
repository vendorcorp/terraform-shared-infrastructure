data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "selected" {
  tags = {
    environment = var.environment
    resource    = "vpc"
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  tags = {
    environment = var.environment
    access      = "private"
  }
}

data "aws_subnet" "private" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  tags = {
    environment = var.environment
    access      = "public"
  }
}

data "aws_subnet" "public" {
  for_each = toset(data.aws_subnets.public.ids)
  id       = each.value
}

data "aws_eks_cluster" "vendorcorp_eks_cluster" {
  name = var.default_eks_cluster_name
}

data "aws_route53_zone" "zone_vendorcorp_internal" {
  name         = "vendorcorp.internal"
  private_zone = true
}

data "aws_route53_zone" "zone_vendorcorp_public" {
  name         = "vendorcorp.net"
  private_zone = false
}

data "aws_acm_certificate" "vendorcorp" {
  domain   = "*.corp.vendorcorp.net"
  statuses = ["ISSUED"]
  types    = ["AMAZON_ISSUED"]
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = data.aws_eks_cluster.vendorcorp_eks_cluster.arn
}

data "kubernetes_namespace" "namespace_shared_core" {
  metadata {
    name = var.default_namespace_name_shared_core
  }
}
