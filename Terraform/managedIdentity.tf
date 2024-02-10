# data "azurerm_subscription" "primary" {
# }

# data "azuread_client_config" "current" {
# }

# resource "azuread_application" "microsoftEntraId" {
#   display_name = "SPN_SupplyChainOptmization"
#   owners       = [data.azuread_client_config.current.object_id]
# }

# resource "azuread_service_principal" "spn_ado" {
#   application_id               = azuread_application.microsoftEntraId.application_id
#   app_role_assignment_required = false
#   owners                       = [data.azuread_client_config.current.object_id]
# }






# resource "azurerm_user_assigned_identity" "umi_tfstate" {
#   count               = var.deploy_tier ? 1 : 0
#   name                = "umi-sco-tfstate-sea-01"
#   resource_group_name = azurerm_resource_group.rg_tfstate[0].name
#   location            = azurerm_resource_group.rg_tfstate[0].location
# }

# resource "azurerm_role_assignment" "umi_role_sa_tstate" {
#   principal_id         = azurerm_user_assigned_identity.umi_tfstate[0].principal_id
#   role_definition_name = "Contributor"
#   scope                = azurerm_resource_group.rg_tfstate[0].id #azurerm_storage_account.sa_tfstate[0].id
# }



# resource "azurerm_user_assigned_identity" "umi_ado" {
#   count               = var.deploy_tier ? 1 : 0
#   name                = "umi-sco-ado-sea-01"
#   resource_group_name      = data.azurerm_resource_group.rg_tfstate.name
#   location                 = data.azurerm_resource_group.rg_tfstate.location
# }

# resource "azurerm_role_assignment" "umi_role_subs" {
#   principal_id         = azurerm_user_assigned_identity.umi_ado[0].principal_id
#   role_definition_name = "Contributor"
#   scope                = data.azurerm_subscription.primary.id
# }


# resource "azurerm_user_assigned_identity" "umi_ado_stage" {
#   count               = var.deploy_tier ? 1 : 0
#   name                = "umi-sco-ado-stage-sea-01"
#   resource_group_name = azurerm_resource_group.rg_name_stage[0].name
#   location            = azurerm_resource_group.rg_name_stage[0].location
# }

# resource "azurerm_role_assignment" "umi_role__rg_stage" {
#   principal_id         = azurerm_user_assigned_identity.umi_ado_stage[0].principal_id
#   role_definition_name = "Contributor"
#   scope                = azurerm_resource_group.rg_name_stage[0].id
# }

# resource "azurerm_user_assigned_identity" "umi_ado_prod" {
#   count               = var.deploy_tier ? 1 : 0
#   name                = "umi-sco-ado-prod-sea-01"
#   resource_group_name = azurerm_resource_group.rg_name_prod[0].name
#   location            = azurerm_resource_group.rg_name_prod[0].location
# }

# resource "azurerm_role_assignment" "umi_role_rg_prod" {
#   principal_id         = azurerm_user_assigned_identity.umi_ado_prod[0].principal_id
#   role_definition_name = "Contributor"
#   scope                = azurerm_resource_group.rg_name_prod[0].id
# }



