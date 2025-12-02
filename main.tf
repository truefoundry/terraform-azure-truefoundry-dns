# Create new DNS zone (when use_existing_dns_zone = false)
resource "azurerm_dns_zone" "truefoundry_dns_zone" {
  count               = var.use_existing_dns_zone ? 0 : 1
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# Create User Assigned Managed Identity for cert-manager
resource "azurerm_user_assigned_identity" "truefoundry_cert_manager_identity" {
  name                = var.truefoundry_managed_identity_name_override_enabled ? var.truefoundry_managed_identity_override_name : "${var.cluster_name}-${var.managed_identity_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_role_assignment" "truefoundry_dns_zone_contributor" {
  scope                = var.use_existing_dns_zone ? data.azurerm_dns_zone.existing_zone[0].id : azurerm_dns_zone.truefoundry_dns_zone[0].id
  role_definition_name = "DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.truefoundry_cert_manager_identity.principal_id
}

# Create Federated Identity Credential for Workload Identity
resource "azurerm_federated_identity_credential" "truefoundry_cert_manager_federated_identity" {
  name                = var.truefoundry_cert_manager_federated_identity_name_override_enabled ? var.truefoundry_cert_manager_federated_identity_override_name : "${var.cluster_name}-cert-manager-federated-identity"
  resource_group_name = var.resource_group_name
  parent_id           = azurerm_user_assigned_identity.truefoundry_cert_manager_identity.id
  audience            = ["api://AzureADTokenExchange"]
  issuer              = data.azurerm_kubernetes_cluster.aks.oidc_issuer_url
  subject             = "system:serviceaccount:${var.cert_manager_namespace}:${var.cert_manager_service_account}"
}
