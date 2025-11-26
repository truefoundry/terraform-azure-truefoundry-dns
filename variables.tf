variable "use_existing_dns_zone" {
  description = "Flag to use existing DNS zone instead of creating a new one"
  type        = bool
  default     = true
}

variable "dns_zone_name" {
  description = "DNS zone name (e.g., example.com)"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Azure region location"
  type        = string
  default     = "eastus"
}

variable "managed_identity_name" {
  description = "Name for the managed identity"
  type        = string
  default     = "cert-manager-dns-identity"
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

variable "oidc_issuer_url" {
  description = "OIDC issuer URL for workload identity (from AKS cluster)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
