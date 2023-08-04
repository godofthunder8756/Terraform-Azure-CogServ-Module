// ---------------------------------------------------------------------------------------------------------------------
// DEFINE DATA SOURCES
// ------------------------------------------------------------------------------------------

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_cognitive_account" "cognitive_service" {
  name                = "${var.division}-${var.project_name}-${var.enviroment}-cognitiveaccount"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku_name            = "S0"
  kind                = "CognitiveServices"
  tags                = var.tags

  # enable_private_endpoint = true
  # private_endpoint_network_subnet_id = "/subscriptions/your-subscription-id/resourceGroups/your-vnet-resource-group/providers/Microsoft.Network/virtualNetworks/your-vnet/subnets/your-subnet"
  # private_endpoint_connections = [
  #   {
  #     name                           = "private-endpoint-connection"
  #     private_endpoint_id            = azurerm_private_endpoint.cognitive_service_endpoint.id
  #     private_link_service_id        = azurerm_private_link_service.cognitive_service.id
  #     is_manual_connection           = false
  #     private_link_service_location  = var.location
  #     private_link_service_subnet_id = "/subscriptions/your-subscription-id/resourceGroups/your-vnet-resource-group/providers/Microsoft.Network/virtualNetworks/your-vnet/subnets/your-subnet"
  #   }
  # ]

  identity {
    type = var.use_user_assigned_identity ? "UserAssigned" : "SystemAssigned"
  }
}

# resource "azurerm_private_endpoint" "cognitive_service_endpoint" {
#   name                          = "${azurerm_cognitive_account.cognitive_service.name}-pe"
#   location                      = azurerm_resource_group.cognitive_service_rg.location
#   resource_group_name           = azurerm_resource_group.cognitive_service_rg.name
#   subnet_id                     = "/subscriptions/your-subscription-id/resourceGroups/your-vnet-resource-group/providers/Microsoft.Network/virtualNetworks/your-vnet/subnets/your-subnet"
#   private_link_service_id       = azurerm_private_link_service.cognitive_service.id
#   private_link_service_location = var.location
# }