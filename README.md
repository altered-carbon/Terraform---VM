# Terraform---VM
## Project Requirements:
	
	a.) Use Consul for remote TF State.
	b.) Create a VNET module for VNet, subnet and NIC creation.
	c.) Create code to deploy the VM using module as a source.
	d.) Create three environments/terraform workspaces DEV, UAT and PROD.
	e.) The three environments should have different vnet address range, subnet and instance counts and VM sizes.
	f.) Use consul as data source for respective terraform workspaces.
