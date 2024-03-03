locals {
  tags = {
    environment = var.env
  }

  # Resource Group Name
  rg_name = format("rg%s%s%s%s", "az", var.env, "sea", var.instance) // rgazdevsea01

  # Storage Account Name
  storage_account_name    = format("sa%s%s%s%s", "az", var.env, "sea", var.instance)       // saazdevsea01
  tfstate_container_name  = format("tfstate%s%s%s%s", "az", var.env, "sea", var.instance)  // tfstateazdevsea01
  tfstate_container_name2 = format("tfstate2%s%s%s%s", "az", var.env, "sea", var.instance) // tfstateazdevsea01

  # Source VirtualNetwork Name
  vnet_name = format("vnet-%s-%s-%s-%s", "az", var.env, "sea", var.instance)

}
