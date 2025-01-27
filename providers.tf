#
# Linode Kubernetes Engine (LKE) Provider definitions
#
terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 2.0"
    }
  }
}

provider "linode" {
  token       = var.linode_token
  url         = var.linode_api_url
  api_version = var.linode_api_version
}