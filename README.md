# terraform-azure-truefoundry-dns
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.107.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.107.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_zone.truefoundry_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_federated_identity_credential.truefoundry_cert_manager_federated_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/federated_identity_credential) | resource |
| [azurerm_role_assignment.truefoundry_dns_zone_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.truefoundry_cert_manager_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_dns_zone.existing_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/dns_zone) | data source |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_namespace"></a> [cert\_manager\_namespace](#input\_cert\_manager\_namespace) | Kubernetes namespace where cert-manager is installed | `string` | `"cert-manager"` | no |
| <a name="input_cert_manager_service_account"></a> [cert\_manager\_service\_account](#input\_cert\_manager\_service\_account) | Kubernetes service account name for cert-manager | `string` | `"cert-manager"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the AKS cluster | `string` | n/a | yes |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | DNS zone name (e.g., example.com) | `string` | `""` | no |
| <a name="input_existing_zone_resource_group_name"></a> [existing\_zone\_resource\_group\_name](#input\_existing\_zone\_resource\_group\_name) | Resource group name of the existing DNS zone (required if use\_existing\_dns\_zone is true) | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region location | `string` | n/a | yes |
| <a name="input_managed_identity_name"></a> [managed\_identity\_name](#input\_managed\_identity\_name) | Name for the managed identity | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Azure resource group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_truefoundry_cert_manager_federated_identity_name_override_enabled"></a> [truefoundry\_cert\_manager\_federated\_identity\_name\_override\_enabled](#input\_truefoundry\_cert\_manager\_federated\_identity\_name\_override\_enabled) | Flag to enable TrueFoundry cert-manager federated identity name override | `bool` | `false` | no |
| <a name="input_truefoundry_cert_manager_federated_identity_override_name"></a> [truefoundry\_cert\_manager\_federated\_identity\_override\_name](#input\_truefoundry\_cert\_manager\_federated\_identity\_override\_name) | Override name for TrueFoundry cert-manager federated identity | `string` | `""` | no |
| <a name="input_truefoundry_managed_identity_name_override_enabled"></a> [truefoundry\_managed\_identity\_name\_override\_enabled](#input\_truefoundry\_managed\_identity\_name\_override\_enabled) | Flag to enable TrueFoundry managed identity name override | `bool` | `false` | no |
| <a name="input_truefoundry_managed_identity_override_name"></a> [truefoundry\_managed\_identity\_override\_name](#input\_truefoundry\_managed\_identity\_override\_name) | Override name for TrueFoundry managed identity | `string` | `""` | no |
| <a name="input_use_existing_dns_zone"></a> [use\_existing\_dns\_zone](#input\_use\_existing\_dns\_zone) | Flag to use existing DNS zone instead of creating a new one | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_zone_nameservers"></a> [dns\_zone\_nameservers](#output\_dns\_zone\_nameservers) | Name servers for the DNS zone |
| <a name="output_managed_identity_client_id"></a> [managed\_identity\_client\_id](#output\_managed\_identity\_client\_id) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource group name of the DNS zone |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | Subscription ID for the DNS zone |
<!-- END_TF_DOCS -->