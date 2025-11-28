variable "use_existing_dns_zone" {
  description = "Flag to use existing DNS zone instead of creating a new one"
  type        = bool
  default     = false
}

variable "dns_zone_name" {
  description = "DNS zone name (e.g., example.com)"
  type        = string
  default     = ""
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Azure region location"
  type        = string
}

variable "managed_identity_name" {
  description = "Name for the managed identity"
  type        = string
  default     = ""
}

variable "cert_manager_namespace" {
  description = "Kubernetes namespace where cert-manager is installed"
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_service_account" {
  description = "Kubernetes service account name for cert-manager"
  type        = string
  default     = "cert-manager"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "truefoundry_managed_identity_name_override_enabled" {
  description = "Flag to enable TrueFoundry managed identity name override"
  type        = bool
  default     = false
}

variable "truefoundry_managed_identity_override_name" {
  description = "Override name for TrueFoundry managed identity"
  type        = string
  default     = ""
}