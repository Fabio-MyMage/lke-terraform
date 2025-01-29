#
# Linode Kubernetes Engine (LKE) Cluster outputs
#
output "id" {
  description = "The ID of the LKE cluster."
  value       = linode_lke_cluster.lke.id
}

output "kubeconfig" {
  description = "The kubeconfig for the LKE cluster."
  value       = linode_lke_cluster.lke.kubeconfig
  sensitive   = true
}

output "dashboard_url" {
  description = "The dashboard URL of the LKE cluster."
  value       = linode_lke_cluster.lke.dashboard_url
}

output "api_endpoints" {
  description = "The API endpoints of the LKE cluster."
  value       = linode_lke_cluster.lke.api_endpoints
}

output "default_pool" {
  description = "The default node pool of the LKE cluster."
  value = [
    for pool in linode_lke_cluster.lke.pool : {
      id    = pool.id
      nodes = pool.nodes
    }
  ]
}

output "additional_pool" {
  description = "The additional node pool of the LKE cluster."
  value = {
    id    = linode_lke_node_pool.lke-additional-node-pool.id
    nodes = linode_lke_node_pool.lke-additional-node-pool.nodes
  }
}

output "status" {
  description = "The status of the LKE cluster."
  value       = linode_lke_cluster.lke.status
}