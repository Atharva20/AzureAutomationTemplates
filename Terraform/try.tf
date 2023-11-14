# data "azuread_client_config" "current" {}

# resource "azuread_application" "sco-ado-mi" {
#     name                       = "sco-ado-mi"
#     available_to_other_tenants = false
#     type                       = "webapp/api"
#     identifier_uris            = ["api://supplyChainOptimization"]
# }


# resource "azurerm_user_assigned_identity" "umi_ado" {
#   count               = var.deploy_tier ? 1 : 0
#   name                = "umi-sco-ado-sea-01"
#   resource_group_name = azurerm_resource_group.rg_tfstate[0].name
#   location            = azurerm_resource_group.rg_tfstate[0].location
# }

# resource "azurerm_role_assignment" "umi_role_subs" {
#   principal_id         = azurerm_user_assigned_identity.umi_ado[0].principal_id
#   role_definition_name = "Contributor"
#   scope                = data.azurerm_subscription.primary.id
# }

# resource "azurerm_role_assignment" "umi_role_subs" {
#   principal_id         = azurerm_user_assigned_identity.umi_ado[0].principal_id
#   role_definition_name = "Contributor"
#   scope                = data.azuread_client_config.current.id
# }

# resource "azurerm_role_assignment" "umi_role_ado" {
#   principal_id         = azurerm_user_assigned_identity.umi_ado[0].principal_id
#   role_definition_name = "Contributor"
#   scope                = azuread_application.sco-ado-mi.id
# }
