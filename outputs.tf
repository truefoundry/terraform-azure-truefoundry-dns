output "dns_zone_nameservers" {
  description = "Name servers for the DNS zone"
  value       = var.use_existing_dns_zone ? data.azurerm_dns_zone.existing_zone[0].name_servers : azurerm_dns_zone.truefoundry_zone[0].name_servers
}
