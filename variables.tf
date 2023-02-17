variable "primary_cluster_hvn" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "hvn-us-east-1"
}

variable "aws_region"{}

variable "vpc_cidr" {
  default ="10.0.1.0/24"
}

variable "az" {
  default ="us-east-2a"
}


variable "primary_cluster_hvn_cidr" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "172.25.16.0/20"
}

variable "secondary_cluster_hvn" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "hvn-us-west-2"
}

variable "secondary_cluster_hvn_cidr" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "172.24.16.0/20"
}

variable "primary_cluster_id" {
  description = "The ID of the HCP Vault cluster."
  type        = string
  default     = "vault-cluster-primary"
}

variable "secondary_cluster_id" {
  description = "The ID of the HCP Vault cluster."
  type        = string
  default     = "vault-cluster-secondary"
}

variable "primary_region" {
  description = "The region of the primary cluster HCP HVN and Vault cluster."
  type        = string
  default     = "us-east-1"
}

variable "secondary_region" {
  description = "The region of the secondary cluster HCP HVN and Vault cluster."
  type        = string
  default     = "us-west-2"
}

variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Vault cluster."
  type        = string
  default     = "aws"
}

variable "tier" {
  description = "Tier of the HCP Vault cluster. Valid options for tiers."
  type        = string
  default     = "plus_small"
}

variable "grafana_endpoint"{


}

variable "grafana_username"{


}

variable "grafana_password"{

    
}