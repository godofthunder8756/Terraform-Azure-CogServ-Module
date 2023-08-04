variable "resource_group_name" {
  description = "Name of the resource group."
}

variable "location" {
  description = "Azure region where the resource should be provisioned."
  default     = "eastus"
}

variable "tags" {
  description = "Tags to be applied to the Azure Cognitive Services resource."
  type        = map(string)
  default     = {}
}

variable "use_user_assigned_identity" {
  description = "Flag to indicate whether to use a user-assigned managed identity."
  type        = bool
  default     = false
}

variable "division" {
  type        = string
  description = "Divison the Key Vault is being provisioned for."
  default     = "gts"
}

variable "bu" {
  type        = string
  description = "Business unit"
  default     = "intern"
}
variable "enviroment" {
  type        = string
  description = "The enviroment the resource is being provisioned for."
  default     = "dev"
}

variable "project_name" {
  type        = string
  description = "Project code/name"
  default     = "tst"
}