output "rg" {
  value = azurerm_resource_group.rg
}

output "nicid" {
  value = [for nic in range(local.instancecount) : azurerm_network_interface.nic[nic].id]
}

output "nameprefix" {
  value = local.naming_prefix
}

output "tags" {
  value = local.common_tags
}

output "vmsize" {
  value = local.vmsize
}

output "instancecount" {
  value = local.instancecount
}

