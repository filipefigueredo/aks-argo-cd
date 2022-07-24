terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.99"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.8.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }
  }

  cloud {
    organization = "filipefigueredo"

    workspaces {
      name = "aks-argo-cd-poc"
    }
  }

  required_version = ">= 1.1.0"
}





