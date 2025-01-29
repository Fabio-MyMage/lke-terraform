#
# Linode Kubernetes Engine (LKE) Cluster definition
#
locals {
  external_pool_tag = "additional_pool"
}

resource "linode_lke_cluster" "lke" {
  label       = var.linode_lke_label
  k8s_version = var.k8s_version
  region      = var.linode_lke_region

  # https://techdocs.akamai.com/cloud-computing/docs/high-availability-ha-control-plane-on-lke
  control_plane {
    high_availability = var.linode_lke_ha_control_plane
  }

  pool {
    type  = var.linode_lke_default_pool_type
    count = var.linode_lke_default_pool_count

    autoscaler {
      min = var.linode_lke_default_pool_count
      max = var.linode_lke_default_pool_count * var.linode_lke_default_pool_autoscaling_multiplier
    }

    tags = ["default_pool"]
  }

  external_pool_tags = [local.external_pool_tag]
}

resource "linode_lke_node_pool" "lke-additional-node-pool" {
  cluster_id = linode_lke_cluster.lke.id
  type       = var.linode_lke_additional_pool_type
  node_count = var.linode_lke_additional_pool_count

  autoscaler {
    min = var.linode_lke_additional_pool_count
    max = var.linode_lke_additional_pool_count * var.linode_lke_additional_pool_autoscaling_multiplier
  }

  tags = [local.external_pool_tag]
}