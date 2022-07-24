variable "project" {
  description = "Name of the project to which the resources should be assigned."
  type        = string

  validation {
    condition     = can(coalesce(var.project))
    error_message = "The 'project' value is invalid. It must be a non-empty string."
  }
}

variable "environment" {
  description = "The environment in which the resource should be provisioned."
  type        = string

  validation {
    condition     = contains(["production", "development", "staging", "quality"], var.environment)
    error_message = "The 'environment' value is invalid. Valid options are 'production', 'development', 'staging', 'quality'."
  }
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the desired resource."
  type        = map(string)

  validation {
    condition     = alltrue([for tag in var.tags : can(coalesce(tag))])
    error_message = "At least on tag value from 'tags' is invalid. They must be a non-empty string."
  }

  default = {
    terraform = "true"
  }
}

variable "location" {
  # For a complete list of available Azure regions run at cli:  
  # az account list-locations  --query "[].{displayName:displayName, location:name}" --output table
  description = "The Azure Region where the resource should exist."
  type        = string

  validation {
    condition     = can(coalesce(var.location))
    error_message = "The 'location' value is invalid. It must be a non-empty string."
  }
}

variable "resource_group_name" {
  description = "The Name which should be used for this Resource Group."
  type        = string

  validation {
    condition     = can(coalesce(var.resource_group_name))
    error_message = "The 'resource_group_name' value is invalid. It must be a non-empty string."
  }
}

variable "aks_cluster_name" {
  description = "The name of the Managed Kubernetes Cluster to create."
  type        = string

  validation {
    condition     = can(coalesce(var.aks_cluster_name))
    error_message = "The 'aks_cluster_name' value is invalid. It must be a non-empty string."
  }
}

variable "aks_dns_prefix" {
  description = "The name of the Managed Kubernetes Cluster to create."
  type        = string

  validation {
    condition     = can(coalesce(var.aks_dns_prefix))
    error_message = "The 'aks_cluster_name' value is invalid. It must be a non-empty string."
  }
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster."
  type        = string

  validation {
    condition     = can(coalesce(var.kubernetes_version))
    error_message = "The 'kubernetes_version' value is invalid. It must be a non-empty string."
  }
}
