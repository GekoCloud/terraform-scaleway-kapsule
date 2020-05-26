output "scaleway_k8s_cluster_beta_id" {
  value = scaleway_k8s_cluster_beta.this.id
}

output "scaleway_k8s_cluster_beta_created_at" {
  value = scaleway_k8s_cluster_beta.this.created_at
}

output "scaleway_k8s_cluster_beta_updated_at" {
  value = scaleway_k8s_cluster_beta.this.updated_at
}

output "scaleway_k8s_cluster_beta_apiserver_url" {
  value = scaleway_k8s_cluster_beta.this.apiserver_url
}

output "scaleway_k8s_cluster_beta_wildcard_dns" {
  value = scaleway_k8s_cluster_beta.this.wildcard_dns
}

output "scaleway_k8s_cluster_beta_config_file" {
  value = scaleway_k8s_cluster_beta.this.kubeconfig[0].config_file
}

output "scaleway_k8s_cluster_beta_host" {
  value = scaleway_k8s_cluster_beta.this.kubeconfig[0].host
}

output "scaleway_k8s_cluster_beta_cluster_ca_certificate" {
  value = scaleway_k8s_cluster_beta.this.kubeconfig[0].cluster_ca_certificate
}

output "scaleway_k8s_cluster_beta_token" {
  value = scaleway_k8s_cluster_beta.this.kubeconfig[0].token
}

output "scaleway_k8s_cluster_beta_status" {
  value = scaleway_k8s_cluster_beta.this.status
}

output "scaleway_k8s_cluster_beta_upgrade_available" {
  value = scaleway_k8s_cluster_beta.this.upgrade_available
}
