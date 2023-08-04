provider "azurerm" {

  features {}

}

module "cognitive_services" {
  source              = "../../"
  resource_group_name = "terraform-test-AAhern-rg"
}