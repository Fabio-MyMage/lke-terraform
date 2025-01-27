# Linode Kubernetes Engine (LKE) Terraform Module

This repository contains a Terraform module for provisioning and managing a Linode Kubernetes Engine (LKE) cluster. The module includes configurations for setting up the LKE cluster, defining input variables, and outputting important information such as the kubeconfig, cluster ID, dashboard URL, API endpoints, pool details, and cluster status.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Linode API token

## Usage

To use this module in your Terraform configuration, add the following to your `main.tf` file:

```
module "lke_cluster" {
  source = "github.com/Fabio-MyMage/lke-terraform"

  linode_token          = var.linode_token
  linode_lke_label      = var.linode_lke_label
  region                = var.region
  pool_type             = var.pool_type
  pool_count            = var.pool_count
  k8s_version           = var.k8s_version
}
```