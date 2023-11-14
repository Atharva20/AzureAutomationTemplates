
# resource "azurerm_storage_account" "example" {    
#   count                    = var.deploy_tier ? 1 : 0
#   name                     = "functionsapptestsa"
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

# #   newtwork_rules
# #   {
# #     default_action = "Deny"
# #     bypass = ["None"]
# #     virtual_netowrk_subnet_ids = []
# #     ip_rules = []
# #   }
# }

# # resource "azurerm_private_endpoint" "functionapp_storage_blob_private_endpoint"{
# #    count               = var.deploy_tier ? 1 : 0
# #    name = ""
# #    location = ""
# #    resource_group_name = ""
# #    subnet_id = ""

# #    private_service_connection{
# #     name = "" #funcapp name
# #     private_connection_resource_id = azurerm_storage_account.name.id
# #     subresource_names = ["blob"]
# #     is_maual_connection = false
# #    }

# # }
# a
# resource "azurerm_app_service_plan" "example" {
#   name                = "azure-functions-test-service-plan"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   sku {
#     tier = "Standard"
#     size = "S1"
#   }
# }

# resource "azurerm_function_app" "example" {
#   count                      = var.deploy_tier ? 1 : 0
#   name                       = "test-azure-functions"
#   location                   = azurerm_resource_group.example.location
#   resource_group_name        = azurerm_resource_group.example.name
#   app_service_plan_id        = azurerm_app_service_plan.example.id

#   storage_account_name       = azurerm_storage_account.example.name
#   storage_account_access_key = azurerm_storage_account.example.primary_access_key
#   version = "~4"
#   enable_bultin_logging = false

#   app_settings = {
    
#   }
# }