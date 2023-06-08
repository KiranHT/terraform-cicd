terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.53.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "2f194eac-d198-4087-a11d-b84257a40f66"
  tenant_id = "edcef96e-1fd5-40df-ba57-1b4f2823db97"
  client_id = "3b815dfe-62e4-40fe-ac7b-ad86ec28c5af"
  client_secret= "JT_8Q~KMGu2-rifIu2edg9RhhHbI3c~jcLdnbc6C"
  features {}
  
}


resource "azurerm_resource_group" "rg" {
  name     = "testing-rg"
  location = "Central India"
}

resource "azurerm_virtual_network" "vn" {
  name                = "testing-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
