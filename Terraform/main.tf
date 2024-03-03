terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rgazdevsea01"
  #   storage_account_name = "saazdevsea01"
  #   container_name       = "tfstateazdevsea01"
  #   key                  = "terraform.tfstate"
  # }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_tfstate" {
  count    = var.deploy_tier ? 1 : 0
  name     = local.rg_name
  location = var.location
}

# resource "azurerm_resource_group" "rg_vnet1" {
#   count    = var.deploy_tier ? 1 : 0
#   name     = "rg-sco-vnet1-sea-01"
#   location = var.location
# }

# resource "azurerm_resource_group" "rg_vnet2" {
#   count    = var.deploy_tier ? 1 : 0
#   name     = "rg-sco-vnet2-sea-01"
#   location = var.location
# }

# resource "azurerm_resource_group" "rg_dev" {
#   count    = var.deploy_tier ? 1 : 0
#   name     = "rg-sco-dev-sea-01"
#   location = var.location
# }

# resource "azurerm_resource_group" "rg_stage" {
#   count    = var.deploy_tier ? 1 : 0
#   name     = "rg-sco-stage-sea-01"
#   location = var.location
# }

# resource "azurerm_resource_group" "rg_prod" {
#   count    = var.deploy_tier ? 1 : 0
#   name     = "rg-sco-prod-sea-01"
#   location = var.location
# }

