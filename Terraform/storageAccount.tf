# data "azurerm_resource_group" "rg_tfstate" {
#   name = "rg-sco-tfstate-sea-01" # Replace with the name of your pre-existing resource group
# }

# resource "azurerm_storage_account" "sa_tfstate" {
#   count                    = var.deploy_tier ? 1 : 0
#   name                     = "terraformstoragescosea01"
#   resource_group_name      = data.azurerm_resource_group.rg_tfstate.name
#   location                 = data.azurerm_resource_group.rg_tfstate.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

# }

# resource "azurerm_storage_container" "sa_tfstate_container_dev" {
#   count                 = var.deploy_tier ? 1 : 0
#   name                  = "terraform-dev"
#   storage_account_name  = azurerm_storage_account.sa_tfstate[0].name
#   container_access_type = "private"
# }

# resource "azurerm_storage_container" "sa_tfstate_container_stage" {
#   count                 = var.deploy_tier ? 1 : 0
#   name                  = "terraform-stage"
#   storage_account_name  = azurerm_storage_account.sa_tfstate[0].name
#   container_access_type = "private"
# }

# resource "azurerm_storage_container" "sa_tfstate_container_prods" {
#   count                 = var.deploy_tier ? 1 : 0
#   name                  = "terraform-prod"
#   storage_account_name  = azurerm_storage_account.sa_tfstate[0].name
#   container_access_type = "private"
# }


