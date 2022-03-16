variable "environment" {
  description = "Target environment (ci, staging or production)"
  type        = string
  default     = "production"
}

variable "default_eks_cluster_name" {
  description = "Name of the EKS Cluster for Vendor Corp"
  type        = string
  default     = "vendorcorp-us-east-2-wDOI3pOv"
}

variable "default_namespace_name_shared_core" {
  description = "The default namespace used for shared-core"
  type        = string
  default     = "shared-core"
}
