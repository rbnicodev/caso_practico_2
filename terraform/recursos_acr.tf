resource "azurerm_container_registry" "my_acr" {
  name                     = var.acr_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "Premium"
  admin_enabled            = true
  anonymous_pull_enabled   = true
}

resource "azurerm_network_security_group" "nsg_acr_to_vm" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "nsr_acr_to_vm" {
  name                        = var.nsr_name
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443" 
  source_address_prefix       = "*" 
  destination_address_prefix  = "0.0.0.0/0"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg_acr_to_vm.name
}


/* resource "azurerm_role_assignment" "acr_to_aks" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.rg.id
  skip_service_principal_aad_check = true
} */
