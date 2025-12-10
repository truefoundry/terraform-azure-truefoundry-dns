data "azurerm_subscription" "current" {}

# Data source for existing DNS zone (when use_existing_dns_zone = true)
data "azurerm_dns_zone" "existing_zone" {
  count               = var.use_existing_dns_zone ? 1 : 0
  name                = var.dns_zone_name
  resource_group_name = var.existing_zone_resource_group_name != "" ? var.existing_zone_resource_group_name : var.resource_group_name
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
}