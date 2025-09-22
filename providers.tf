terraform {
  required_version = ">= 1.8.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0" # latest
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "0dc9cc28-788b-4a57-a7e9-e558dae97809"
  tenant_id       = "a894103d-b571-4b0d-80e5-ba54279db630"
}