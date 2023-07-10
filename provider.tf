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
 
  features {}
  
}

