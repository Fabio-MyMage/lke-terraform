#
# Variables for the Linode Kubernetes Engine (LKE) Terraform module.
#

variable "linode_token" {
  description = "Token for Linode API"
  type        = string
  sensitive   = true
}

variable "linode_api_url" {
  description = "URL for Linode API"
  type        = string
  default     = "https://api.linode.com/v4"
}

variable "region" {
  description = "The region to deploy the LKE cluster in."
  default     = "us-east"
}

variable "pool_count" {
  description = "The number of instances to provision in the LKE cluster."
  default     = 3
}

variable "pool_type" {
  description = "The type of instances to provision in the LKE cluster."
  default     = "g6-standard-2"
}