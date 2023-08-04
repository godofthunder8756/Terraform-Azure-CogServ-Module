variable "resource_group_name" {
  type        = string
  description = "Name of the existing resource group the Key Vault will be provisioned in."
  default     = "terraform-test-AAhern-rg"

}

variable "subnet_id" {
  type        = string
  description = "The id of an existing subnet."
  default     = "/subscriptions/25ffd3aa-bddf-4dab-86db-498a0c1619e0/resourceGroups/network-rg/providers/Microsoft.Network/virtualNetworks/gts-dev-pvnet/subnets/pe"
}