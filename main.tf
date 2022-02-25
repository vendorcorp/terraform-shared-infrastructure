data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "selected" {
  tags = {
    environment = var.environment
    resource    = "vpc"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.selected.id

  tags = {
    environment = var.environment
    access      = "private"
  }
}

data "aws_subnet" "private" {
  for_each = data.aws_subnet_ids.private.ids
  id       = each.value
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.selected.id

  tags = {
    environment = var.environment
    access      = "public"
  }
}

data "aws_subnet" "public" {
  for_each = data.aws_subnet_ids.public.ids
  id       = each.value
}

data "aws_eks_cluster" "vendorcorp_eks_cluster" {
  name = "vendorcorp-us-east-2-wDOI3pOv"
}
