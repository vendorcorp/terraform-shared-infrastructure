# Terraform Shared Infrastructure

Shared Module for referencing common Vendor Corp infrastructure.

## Usage

```hcl
provider "aws" {
  region = var.region
}

module "shared_infrastructure" {
  source = "git::ssh://git@github.com/vendorcorp/terraform-shared-infrastructure.git?ref=v0.1.2"
  environment = var.environment
}
```

## Inputs

Currently - we only have one environment - production!

| Name        | Description                |  Type  | Default | Required |  Options   |
| ----------- | -------------------------- | :----: | :-----: | :------: | :--------: |
| environment | Infrastructure environment | string |   ``    |   yes    | production |

## Outputs

| Name                          | Description                                                                |
| ----------------------------- | -------------------------------------------------------------------------- |
| availability_zones            | List of available AZs in SI environment                                    |
| dns_zone_internal_arn         | ARN of the Hosted DNS Zone for internal Vendor Corp                        |
| dns_zone_internal_id          | ID of the Hosted DNS Zone for internal Vendor Corp                         |
| dns_zone_internal_name        | DNS name of the Hosted DNS Zone for internal Vendor Corp                   |
| dns_zone_public_arn           | ARN of the Hosted DNS Zone for public Vendor Corp (vendorcorp.net)         |
| dns_zone_public_id            | ID of the Hosted DNS Zone for public Vendor Corp (vendorcorp.net)          |
| dns_zone_public_name          | DNS name of the Hosted DNS Zone for public Vendor Corp (vendorcorp.net)    |
| eks_cluster_arn               | ARN of the Vendor Corp EKS Cluster                                         |
| eks_cluster_security_group_id | Main Security Group for the Vendor Corp EKS Cluster |
| eks_cluster_id                | ID of the Vendor Corp EKS Cluster                                          |
| eks_cluster_oidc_issuer       | OIDC Issuer URL for Vendor Corp EKS Cluster                                |
| eks_cluster_oidc_provider_arn | ARN of the OIDC Provider for the Vendor Corp EKS Cluster                   |
| namespace_shared_core_name    | Name of the Kubernetes Namespace where Shared Core applications run        |
| pgsql_cluster_arn             | ARN of the Vendor Corp PostgreSQL Cluster (Amazon Aurora RDS)              |
| pgsql_cluster_endpoint_read   | Read enpoint for Vendor Corp PostgreSQL Cluster                            |
| pgsql_cluster_endpoint_write  | Write enpoint for Vendor Corp PostgreSQL Cluster                           |
| pgsql_cluster_master_username | Master username for managing Vendor Corp PostgreSQL Cluster                |
| pgsql_cluster_port            | Port to connect to Vendor Corp PostgreSQL Cluster on                       |
| private_subnet_cidrs          | List of private subnet CIDR ranges in SI VPC                               |
| private_subnet_ids            | List of private subnet IDs in SI VPC                                       |
| private_subnet_ids_az_map     | Map of private subnet IDs in SI VPC keyed by Availability Zone             |
| public_subnet_cidrs           | List of public subnet CIDR ranges in SI VPC                                |
| public_subnet_ids             | List of public subnet IDs in SI VPC                                        |
| public_subnet_ids_az_map      | Map of public subnet IDs in SI VPC keyed by Availability Zone              |
| vendorcorp_net_cert_arn       | ARN of public certification for *.corp.vendorcorp.net and *.vendorcorp.net |
| vpc_cidr                      | VPC CIDR range for SI environment                                          |
| vpc_id                        | VPC ID for SI environment                                                  |


# The Fine Print

At the time of writing I work for Sonatype, and it is worth nothing that this is **NOT SUPPORTED** bu Sonatype - it is purely a contribution to the open source community (read: you!).

Remember:
- Use this contribution at the risk tolerance that you have
- Do NOT file Sonatype support tickets related to cheque support in regard to this project
- DO file issues here on GitHub, so that the community can pitch in