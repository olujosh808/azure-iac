provider "azurerm" {
  features {}
}

# 1. Query the existing Resource Group in Azure
data "azurerm_resource_group" "anubys" {
  name = "anubisrg" # Ensure this matches the exact name of your resource group in Azure
}

# 2. First Storage Account
resource "azurerm_storage_account" "anubys" {
  name                     = "anubysstorageacct"
  resource_group_name      = data.azurerm_resource_group.anubys.name
  location                 = data.azurerm_resource_group.anubys.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# 3. Second Storage Account (Fixed data references & assigned unique name)
resource "azurerm_storage_account" "anubyshome" {
  name                     = "anubyshomerstorageacct" # Must be globally unique across Azure
  resource_group_name      = data.azurerm_resource_group.anubys.name
  location                 = data.azurerm_resource_group.anubys.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# 4. Virtual Network (Fixed resource group reference and location binding)
resource "azurerm_virtual_network" "anubys_vnet" {
  name                = "anubys-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.anubys.location
  resource_group_name = data.azurerm_resource_group.anubys.name

  tags = {
    Environment = "Production"
    ManagedBy   = "olujoshua"
  }
}