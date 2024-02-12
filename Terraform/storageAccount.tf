resource "azurerm_storage_account" "sa_tfstate" {
  count                    = var.deploy_tier ? 1 : 0
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.rg_tfstate[0].name
  location                 = azurerm_resource_group.rg_tfstate[0].location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "sa_tfstate_container_dev" {
  count                 = var.deploy_tier ? 1 : 0
  name                  = local.tfstate_container_name
  storage_account_name  = azurerm_storage_account.sa_tfstate[0].name
  container_access_type = "private"
}

# resource "azurerm_storage_container" "sa_tfstate_container_dev2" {
#   count                 = var.deploy_tier ? 1 : 0
#   name                  = local.tfstate_container_name2
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
