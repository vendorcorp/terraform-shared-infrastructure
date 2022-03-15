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
  name = "vendorcorp-us-east-2-wDOI3pOv"
}

data "aws_route53_zone" "zone_vendorcorp_internal" {
  name         = "vendorcorp.internal"
  private_zone = true
}
