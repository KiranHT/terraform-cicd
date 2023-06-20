terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.53.0"
    }
  }
   backend "azurerm" {
      resource_group_name  = "Jenkins-POC"
      storage_account_name = "terraformstorageacc"
      container_name       = "terraform-statefile"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "2f194eac-d198-4087-a11d-b84257a40f66"
  tenant_id = "edcef96e-1fd5-40df-ba57-1b4f2823db97"
  client_id = "3b815dfe-62e4-40fe-ac7b-ad86ec28c5af"
  client_secret= "JT_8Q~KMGu2-rifIu2edg9RhhHbI3c~jcLdnbc6C"
  features {}
  
}

