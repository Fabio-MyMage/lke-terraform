# Linode Kubernetes Engine (LKE) Terraform Configuration

This repository contains Terraform configurations for provisioning and managing a Linode Kubernetes Engine (LKE) cluster. The configurations include setting up the LKE cluster, defining input variables, and outputting important information such as the kubeconfig, cluster ID, dashboard URL, API endpoints, pool details, and cluster status.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Linode API token

### Variables

The following variables can be configured in the `variables.tf` file:

- `linode_token`: The Linode API token (sensitive).
- `linode_api_url`: The URL for the Linode API (default: `https://api.linode.com/v4`).
- `linode_api_version`: The version of the Linode API (default: `v4`).
- `linode_lke_label`: The label for the LKE cluster.
- `available_regions`: Set of available regions for the LKE cluster.
- `region`: The region to deploy the LKE cluster in.
- `available_pool_types`: Set of available pool types for the LKE cluster.
- `pool_type`: The type of instances to provision in the LKE cluster.
- `pool_count`: The number of instances to provision in the LKE cluster.
- `available_k8s_versions`: Set of available Kubernetes versions.
- `k8s_version`: The Kubernetes version to use for the LKE cluster.

### Outputs

The following outputs are defined in the `outputs.tf` file:

- `kubeconfig`: The kubeconfig for the LKE cluster (sensitive).
- `id`: The ID of the LKE cluster.
- `dashboard_url`: The dashboard URL of the LKE cluster.
- `api_endpoints`: The API endpoints of the LKE cluster.
- `pools`: The pools of the LKE cluster, including nested `id` and `nodes`.
- `status`: The status of the LKE cluster.

## Usage

1. Clone the repository:
```
git clone https://github.com/your-username/lke-terraform.git
cd lke-terraform
```
2. Initialize Terraform:
```
terraform init
```
3. Review and customize the variables in the variables.tf file as needed.
4. Apply the Terraform configuration:
```
terraform plan
terraform apply
```
5. Retrieve the outputs:
```
terraform output
```