variable "environment" {
  description = "Target environment (ci, staging or production)"
  type        = string
  default     = "production"
}

variable "default_eks_cluster_name" {
  description = "Name of the EKS Cluster for Vendor Corp"
  type        = string
  default     = "vendorcorp-oCBeuuDXqV"
}

variable "default_namespace_name_shared_core" {
  description = "The default namespace used for shared-core"
  type        = string
  default     = "core"
}

variable "default_postgres_rds_cluster_name" {
  description = "Name of the RDS PostgreSQL cluster"
  type        = string
  default     = "vendorcorp-xpwqskp53r"
}
