resource "azurerm_virtual_network" "vnet-tryout1" {
  name                = "vnet-tryout1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_vnet1.location
  resource_group_name = azurerm_resource_group.rg_vnet1.name
}

resource "azurerm_subnet" "sa-subnet1" {
  name                 = "sa-subnet11"
  resource_group_name  = azurerm_resource_group.rg_vnet1.name
  virtual_network_name = azurerm_virtual_network.vnet-tryout1.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
}

resource "azurerm_virtual_network" "vnet-tryout2" {
  name                = "vnet-tryout2"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg_vnet2.location
  resource_group_name = azurerm_resource_group.rg_vnet2.name
}

resource "azurerm_subnet" "sa-subnet2" {
  name                 = "sa-subnet21"
  resource_group_name  = azurerm_resource_group.rg_vnet2.name
  virtual_network_name = azurerm_virtual_network.vnet-tryout.name
  address_prefixes     = ["10.1.1.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
}

resource "azurerm_storage_account" "vnetsatrial" {
  name                     = "vnetsatrial"
  resource_group_name      = azurerm_resource_group.vnet-rg.name
  location                 = azurerm_resource_group.vnet-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "testing"
  }
   network_rules {
    default_action             = "Deny"
    #ip_rules                   = values(var.access_list)
    virtual_network_subnet_ids = [azurerm_subnet.sa-subnet1.id]
    #bypass                     = var.traffic_bypass
  }
}
















# resource "azurerm_resource_group" "vnet-rg" {
#   name     = "vnet-rg"
#   location = "Southeast Asia"
# }

# resource "azurerm_virtual_network" "vnet-tryout" {
#   name                = "vnet-tryout"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.vnet-rg.location
#   resource_group_name = azurerm_resource_group.vnet-rg.name
# }

# resource "azurerm_subnet" "sa-subnet1" {
#   name                 = "sa-subnet1"
#   resource_group_name  = azurerm_resource_group.vnet-rg.name
#   virtual_network_name = azurerm_virtual_network.vnet-tryout.name
#   address_prefixes     = ["10.0.1.0/24"]
#   service_endpoints    = ["Microsoft.Storage"]
# }
# resource "azurerm_subnet" "sa-subnet2" {
#   name                 = "sa-subnet2"
#   resource_group_name  = azurerm_resource_group.vnet-rg.name
#   virtual_network_name = azurerm_virtual_network.vnet-tryout.name
#   address_prefixes     = ["10.0.2.0/24"]
# }
# resource "azurerm_subnet" "sa-subnet3" {
#   name                 = "sa-subnet3"
#   resource_group_name  = azurerm_resource_group.vnet-rg.name
#   virtual_network_name = azurerm_virtual_network.vnet-tryout.name
#   address_prefixes     = ["10.0.3.0/24"]
#   service_endpoints    = ["Microsoft.Storage"]
# }

# resource "azurerm_storage_account" "vnetsatrial" {
#   name                     = "vnetsatrial"
#   resource_group_name      = azurerm_resource_group.vnet-rg.name
#   location                 = azurerm_resource_group.vnet-rg.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

#   tags = {
#     environment = "testing"
#   }
# #    network_rules {
# #     default_action             = "Deny"
# #     #ip_rules                   = values(var.access_list)
# #     virtual_network_subnet_ids = [azurerm_subnet.sa-subnet1.id]
# #     #bypass                     = var.traffic_bypass
# #   }
# }

# resource "azurerm_storage_account_network_rules" "example" {
#   storage_account_id = azurerm_storage_account.vnetsatrial.id

#   default_action             = "Deny"
#   #ip_rules                   = ["103.111.133.142"]
#   virtual_network_subnet_ids = [azurerm_subnet.sa-subnet.id]
#   bypass                     = ["Metrics"]
# }


#############


# resource "azurerm_resource_storage_management_policy" "storageManagementPolicy"{
#     count = var.deploy_tier ? 1 : 0
#     storage_account_id = azurerm_storage_account.storage_account[0].id


#     rule {
#         name = "deleteTheBlobafter2Days"
#         enabled = true
#         filters {
#             blob_types = ["blockBlob"]
#             prefix_match = ["storageBlobName"]
#         }
#         actions {
#             base_blob {
#                 delete_after_days_since_modification_greater_than = 2
#             }
#             snapshot{
#                 delete_after_days_since_creation_greater_than = 2
#             }
#         }
#     }
# }

# resource "azurerm_storage_container" "sa_tfstate_container_dev" {
#   count                 = var.deploy_tier ? 1 : 0
#   name                  = "terraform-dev"
#   storage_account_name  = azurerm_storage_account.sa_tfstate[0].name
#   container_access_type = "private"
# }

# resource "azurerm_storage_blob" "storageBlobName"{
#     count = var.deploy_tier ? 1 : 0
#     name = "storageBlobName"
#     storage_account_name = ""
#     storage_container_name = ""
#     type = "Block"
#     source = "./static-files/dc_activation_lookup_v5.json"
#     depends_on = [
#         azurerm_storage_container.containerKaName
#     ]
# }

# resource "azurerm_storage_blob" "storageBlobName2"{
#     count = var.deploy_tier ? 1 : 0
#     name = "storageBlobNam2e"
#     storage_account_name = ""
#     storage_container_name = ""
#     type = "Block"
#     source = "./static-files/dc_activation_lookup_v5.json"
#     depends_on = [
#         azurerm_storage_container.containerKaName
#     ]
# }