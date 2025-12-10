output "dns_zone_nameservers" {
  description = "Name servers for the DNS zone"
  value       = var.use_existing_dns_zone ? data.azurerm_dns_zone.existing_zone[0].name_servers : azurerm_dns_zone.truefoundry_dns_zone[0].name_servers
}

output "resource_group_name" {
  description = "Resource group name of the DNS zone"
  value       = var.existing_zone_resource_group_name != "" ? var.existing_zone_resource_group_name : var.resource_group_name
}

output "subscription_id" {
  description = "Subscription ID for the DNS zone"
  value       = data.azurerm_subscription.current.subscription_id
}

output "managed_identity_client_id" {
  value = azurerm_user_assigned_identity.truefoundry_cert_manager_identity.client_id
}