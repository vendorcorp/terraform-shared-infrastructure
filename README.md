# Terraform Shared Infrastructure

Shared Module for referencing common Vendor Corp infrastructure.

## Usage

```hcl
provider "aws" {
  region = var.region
}

module "shared_infrastructure" {
  source = "git::ssh://git@github.com/vendorcorp/terraform-shared-infrastructure.git?ref=v0.0.1"
  environment = var.environment
}
```

## Inputs

**NOTE:** Shared Infrastructure tags "development" as "ci" to differentiate from the AWS development account.

| Name        | Description                       |  Type  | Default | Required |         Options         |
| ----------- | --------------------------------- | :----: | :-----: | :------: | :---------------------: |
| environment | Shared Infrastructure environment | string |   ``    |   yes    | ci, staging, production |

## Outputs

| Name                      | Description                                                    |
| ------------------------- | -------------------------------------------------------------- |
| availability_zones        | List of available AZs in SI environment                        |
| private_subnet_cidrs      | List of private subnet CIDR ranges in SI VPC                   |
| private_subnet_ids        | List of private subnet IDs in SI VPC                           |
| private_subnet_ids_az_map | Map of private subnet IDs in SI VPC keyed by Availability Zone |
| public_subnet_cidrs       | List of public subnet CIDR ranges in SI VPC                    |
| public_subnet_ids         | List of public subnet IDs in SI VPC                            |
| public_subnet_ids_az_map  | Map of public subnet IDs in SI VPC keyed by Availability Zone  |
| vpc_cidr                  | VPC CIDR range for SI environment                              |
| vpc_id                    | VPC ID for SI environment                                      |


# The Fine Print

At the time of writing I work for Sonatype, and it is worth nothing that this is **NOT SUPPORTED** bu Sonatype - it is purely a contribution to the open source community (read: you!).

Remember:
- Use this contribution at the risk tolerance that you have
- Do NOT file Sonatype support tickets related to cheque support in regard to this project
- DO file issues here on GitHub, so that the community can pitch in