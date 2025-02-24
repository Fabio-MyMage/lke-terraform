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
  default     = "https://api.linode.com"
}

variable "linode_api_version" {
  description = "Version of Linode API"
  type        = string
  default     = "v4"
}

variable "linode_lke_label" {
  description = "The label for the LKE cluster."
  type        = string
}

variable "available_k8s_versions" {
  description = "Set of available Kubernetes versions"
  type        = set(string)
  default = [
    "1.31",
    "1.30"
  ]
}

variable "k8s_version" {
  description = "The Kubernetes version to use for the LKE cluster."
  type        = string
  default     = "1.31"

  validation {
    condition     = contains(var.available_k8s_versions, var.k8s_version)
    error_message = "Invalid Kubernetes version selected. Available versions are: ${join(", ", var.available_k8s_versions)}"
  }
}

# Based on https://www.linode.com/global-infrastructure/availability/
variable "linode_available_regions" {
  description = "Set of available regions"
  type        = set(string)
  default = [
    "us-southeast", // Atlanta, GA
    "us-ord",       // Chicago, IL
    "us-central",   // Dallas, TX
    "us-west",      // Fremont, CA
    "us-lax",       // Los Angeles, CA
    "us-mia",       // Miami, FL
    "us-east",      // Newark, NJ
    "us-sea",       // Seattle, WA
    "us-iad",       // Washington, D.C.
    "ca-central",   // Toronto, Canada
    "se-sto",       // Stockholm, SE
    "nl-ams",       // Amsterdam, NL
    "it-mil",       // Milan, IT
    "eu-west",      // London, UK
    "gb-lon",       // London, UK Expansion
    "fr-par",       // Paris, FR
    "es-mad",       // Madrid, ES
    "eu-central",   // Frankfurt, DE
    "de-fra-2",     // Frankfurt, DE Expansion
    "ap-south",     // Singapore, SP
    "sg-sin-2",     // Singapore Expansion, SP
    "jp-osa",       // Osaka, JP
    "ap-northeast", // Tokyo, JP
    "jp-tyo-3",     // Tokyo Expansion, JP
    "in-maa",       // Chennai, IN
    "ap-west",      // Mumbai, IN
    "in-bom-2",     // Mumbai Expansion, IN
    "id-cgk",       // Jakarta, ID
    "br-gru",       // São Paulo, BR
    "au-mel",       // Melbourne, AU
    "ap-southeast"  // Sydney, AU
  ]
}

variable "linode_lke_region" {
  description = "The region to deploy the LKE cluster in."
  type        = string
  default     = "gb-lon"

  validation {
    condition     = contains(var.linode_available_regions, var.linode_lke_region)
    error_message = "Invalid region selected. Available regions are: ${join(", ", var.linode_available_regions)}"
  }
}

# Based on https://www.linode.com/community/questions/24779/how-do-i-get-a-list-of-all-of-the-current-plan-types/
variable "linode_available_pool_types" {
  description = "Set of available pool types"
  type        = set(string)
  default = [
    "g6-nanode-1",      // Nanode 1GB
    "g6-standard-1",    // Linode 2GB
    "g6-standard-2",    // Linode 4GB
    "g6-standard-4",    // Linode 8GB
    "g6-standard-6",    // Linode 16GB
    "g6-standard-8",    // Linode 32GB
    "g6-standard-16",   // Linode 64GB
    "g6-standard-20",   // Linode 96GB
    "g6-standard-24",   // Linode 128GB
    "g6-standard-32",   // Linode 192GB
    "g7-highmem-1",     // Linode 24GB
    "g7-highmem-2",     // Linode 48GB
    "g7-highmem-4",     // Linode 90GB
    "g7-highmem-8",     // Linode 150GB
    "g7-highmem-16",    // Linode 300GB
    "g6-dedicated-2",   // Dedicated 4GB
    "g6-dedicated-4",   // Dedicated 8GB
    "g6-dedicated-8",   // Dedicated 16GB
    "g6-dedicated-16",  // Dedicated 32GB
    "g6-dedicated-32",  // Dedicated 64GB
    "g6-dedicated-48",  // Dedicated 96GB
    "g6-dedicated-50",  // Dedicated 128GB
    "g6-dedicated-56",  // Dedicated 256GB
    "g6-dedicated-64",  // Dedicated 512GB
    "g1-gpu-rtx6000-1", // Dedicated 32GB + RTX6000 GPU x1
    "g1-gpu-rtx6000-2", // Dedicated 64GB + RTX6000 GPU x2
    "g1-gpu-rtx6000-3", // Dedicated 96GB + RTX6000 GPU x3
    "g1-gpu-rtx6000-4", // Dedicated 128GB + RTX6000 GPU x4
    "g7-premium-2",     // Premium 4GB
    "g7-premium-4",     // Premium 8GB
    "g7-premium-8",     // Premium 16GB
    "g7-premium-16",    // Premium 32GB
    "g7-premium-32",    // Premium 64GB
    "g7-premium-48",    // Premium 96GB
    "g7-premium-50",    // Premium 128GB
    "g7-premium-56",    // Premium 256GB
    "g7-premium-64"     // Premium 512GB
  ]
}

variable "linode_lke_default_pool_type" {
  description = "The type of instances to provision in the LKE cluster."
  type        = string
  default     = "g6-standard-1"

  validation {
    condition     = contains(var.linode_available_pool_types, var.linode_lke_default_pool_type)
    error_message = "Invalid pool type selected. Available pool types are: ${join(", ", var.linode_available_pool_types)}"
  }
}

variable "linode_lke_additional_pool_type" {
  description = "The type of instances to provision in the LKE cluster."
  type        = string
  default     = "g6-standard-1"

  validation {
    condition     = contains(var.linode_available_pool_types, var.linode_lke_additional_pool_type)
    error_message = "Invalid pool type selected. Available pool types are: ${join(", ", var.linode_available_pool_types)}"
  }
}

variable "linode_lke_default_pool_count" {
  description = "The number of instances to provision in the LKE cluster."
  type        = number
  default     = 1
}

variable "linode_lke_additional_pool_count" {
  description = "The number of instances to provision in the LKE cluster."
  type        = number
  default     = 1
}

variable "linode_lke_default_pool_autoscaling_multiplier" {
  description = "The multiplier for the number of instances to provision in the LKE cluster."
  type        = number
  default     = 1 # Default to 1 effectively disabling autoscaling
}

variable "linode_lke_additional_pool_autoscaling_multiplier" {
  description = "The multiplier for the number of instances to provision in the LKE cluster."
  type        = number
  default     = 1 # Default to 1 effectively disabling autoscaling
}

variable "linode_lke_ha_control_plane" {
  description = "Whether to enable a highly available control plane for the LKE cluster."
  type        = bool
  default     = false
}