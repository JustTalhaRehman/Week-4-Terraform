terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "talhaterraformstate"
    container_name       = "tfstate"
    key                 = "week4.terraform.tfstate"
  }
}
