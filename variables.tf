variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to deploy"
  default     = "anubys"
}

variable "location" {
  type        = string
  description = "Azure region for deployed resources"
  default     = "westus"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}