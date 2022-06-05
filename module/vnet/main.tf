resource "azurerm_resource_group" "rg" {
  name     = "${local.naming_prefix}-rg"
  location = "Central US"
  tags     = local.common_tags

}

resource "azurerm_virtual_network" "vnet" {
  name                = "${local.naming_prefix}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [local.vnetaddressspace]
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnets" {

  count                = local.subnetcount
  name                 = "${local.naming_prefix}-subnet-${count.index + 1}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = [cidrsubnet(local.vnetaddressspace, 8, count.index)]

}

resource "azurerm_network_interface" "nic" {

  count               = local.instancecount
  name                = "${local.naming_prefix}-NIC-${count.index + 1}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  ip_configuration {
    name                          = "frontend"
    subnet_id                     = azurerm_subnet.subnets[(count.index) % local.subnetcount].id
    private_ip_address_allocation = "Dynamic"
  }


}