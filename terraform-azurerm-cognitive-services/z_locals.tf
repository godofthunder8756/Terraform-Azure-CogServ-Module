locals {
  custom_tags = var.tags
  tags = merge(local.custom_tags, data.azurerm_resource_group.rg.tags)
}