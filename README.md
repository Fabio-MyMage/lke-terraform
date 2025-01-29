# Linode Kubernetes Engine (LKE) Terraform Module

This repository contains a Terraform module for provisioning and managing a Linode Kubernetes Engine (LKE) cluster. The module includes configurations for setting up the LKE cluster, defining input variables, and outputting important information such as the kubeconfig, cluster ID, dashboard URL, API endpoints, pool details, and cluster status.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Linode API token

## Usage

To use this module in your Terraform configuration, add the following to your `main.tf` file:

```hcl
module "lke_cluster" {
  source = "github.com/Fabio-MyMage/lke-terraform"

  linode_token                       = var.linode_token
  linode_lke_label                   = var.linode_lke_label
  linode_lke_region                  = var.linode_lke_region
  linode_lke_k8s_version             = var.linode_lke_k8s_version
  linode_lke_ha_control_plane        = var.linode_lke_ha_control_plane
  linode_lke_default_pool_type       = var.linode_lke_default_pool_type
  linode_lke_default_pool_count      = var.linode_lke_default_pool_count
  linode_lke_additional_pool_type    = var.linode_lke_additional_pool_type
  linode_lke_additional_pool_count   = var.linode_lke_additional_pool_count
  linode_lke_pool_autoscaling_multiplier = var.linode_lke_pool_autoscaling_multiplier
}
```