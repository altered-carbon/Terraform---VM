locals {
  naming_prefix = "${var.naming_prefix}-${terraform.workspace}"
  common_tags = {
    CreatedBy      = "utkarshbachchan@outlook.com"
    Environment    = terraform.workspace
    Project        = var.projectcode
    Billing        = var.billingcode
    OrganizationID = "${var.billingcode}-${terraform.workspace}"
  }
  vnetaddressspace = jsondecode(data.consul_keys.networking.var.vnetaddressspace)["vnetaddressspace"]
  vmsize = jsondecode(data.consul_keys.networking.var.vm-size)["vm-size"]
  instancecount = jsondecode(data.consul_keys.networking.var.instance_count)["instance_count"]
  subnetcount = jsondecode(data.consul_keys.networking.var.subnet_count)["subnet_count"]

}