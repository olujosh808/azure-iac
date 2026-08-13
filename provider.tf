terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Remote State Storage Configuration
  backend "azurerm" {
    resource_group_name  = "anubisrg"
    storage_account_name = "tfstate27607"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}