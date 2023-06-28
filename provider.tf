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
  client_id = "c79463a8-cce1-40b8-aea8-c35b9aea1187"
  client_secret= "5w78Q~YCDFTHSwKJ62cjE7y5h3.OgrSmENe-bcMT"
  features {}
  
}

