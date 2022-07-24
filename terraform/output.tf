output "aks_client_certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools."
  value       = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true
}

output "cluster_assigned_mannaged_identity" {
  description = "The AzureAD Object ID of the user-defined Managed Identity assigned to the Kubelets"
  value       = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
}
