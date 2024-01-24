# Terraform Shared Infrastructure

Shared Module for referencing common Vendor Corp infrastructure.

## Usage

```hcl
provider "aws" {
  region = var.region
}

module "shared" {
  source = "git::ssh://git@github.com/vendorcorp/terraform-shared-infrastructure.git?ref=v1.0.0"
  environment = var.environment
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.vendorcorp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_clusters.vendorcorp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_clusters) | data source |
| [aws_iam_openid_connect_provider.vendorcorp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_openid_connect_provider) | data source |
| [aws_rds_cluster.vendorcorp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/rds_cluster) | data source |
| [aws_rds_clusters.vendorcorp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/rds_clusters) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_cluster_arn"></a> [eks\_cluster\_arn](#output\_eks\_cluster\_arn) | n/a |
| <a name="output_eks_cluster_id"></a> [eks\_cluster\_id](#output\_eks\_cluster\_id) | ############################################################################### AWS EKS Cluster ############################################################################### |
| <a name="output_eks_cluster_oidc_issuer"></a> [eks\_cluster\_oidc\_issuer](#output\_eks\_cluster\_oidc\_issuer) | n/a |
| <a name="output_eks_cluster_oidc_provider_arn"></a> [eks\_cluster\_oidc\_provider\_arn](#output\_eks\_cluster\_oidc\_provider\_arn) | n/a |
| <a name="output_eks_cluster_security_group_id"></a> [eks\_cluster\_security\_group\_id](#output\_eks\_cluster\_security\_group\_id) | n/a |
| <a name="output_pgsql_cluster_arn"></a> [pgsql\_cluster\_arn](#output\_pgsql\_cluster\_arn) | ############################################################################### AWS RDS Cluster ############################################################################### |
| <a name="output_pgsql_cluster_endpoint_read"></a> [pgsql\_cluster\_endpoint\_read](#output\_pgsql\_cluster\_endpoint\_read) | n/a |
| <a name="output_pgsql_cluster_endpoint_write"></a> [pgsql\_cluster\_endpoint\_write](#output\_pgsql\_cluster\_endpoint\_write) | n/a |
| <a name="output_pgsql_cluster_master_username"></a> [pgsql\_cluster\_master\_username](#output\_pgsql\_cluster\_master\_username) | n/a |
| <a name="output_pgsql_cluster_port"></a> [pgsql\_cluster\_port](#output\_pgsql\_cluster\_port) | n/a |


# The Fine Print

At the time of writing I work for Sonatype, and it is worth nothing that this is **NOT SUPPORTED** by Sonatype - it is purely a contribution to the open source community (read: you!).

Remember:

-   Use this contribution at the risk tolerance that you have
-   Do NOT file Sonatype support tickets related to cheque support in regard to this project
-   DO file issues here on GitHub, so that the community can pitch in
