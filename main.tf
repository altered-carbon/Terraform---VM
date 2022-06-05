module "vnet" {
  source = "./module/vnet"

}

resource "azurerm_windows_virtual_machine" "vm" {
  count                 = module.vnet.instancecount
  name                  = "${module.vnet.nameprefix}-VM-${count.index + 1}"
  resource_group_name   = module.vnet.rg.name
  location              = module.vnet.rg.location
  size                  = module.vnet.vmsize
  admin_username        = "AzureAdmin"
  admin_password        = var.os_pass
  network_interface_ids = [module.vnet.nicid[count.index]]
  tags                  = module.vnet.tags
  availability_set_id   = azurerm_availability_set.avset.id
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "${module.vnet.nameprefix}-OSDISK-${count.index}"

  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"

  }

}

resource "azurerm_availability_set" "avset" {
  name                = "${module.vnet.nameprefix}-avset"
  resource_group_name = module.vnet.rg.name
  location            = module.vnet.rg.location
  tags                = module.vnet.tags
}

