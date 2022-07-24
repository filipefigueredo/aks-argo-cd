project             = "argo-cd-filipe"
environment         = "development"
location            = "westeurope"
resource_group_name = "rg-argo-cd-filipe-development"
tags = {
  squad   = "infra"
  country = "NL"
  product = "internal"
}

aks_cluster_name = "aks-argo-cd-filipe-development"
aks_dns_prefix   = "k8s-filipe"
kubernetes_version = "1.21.9"