data "consul_keys" "networking" {
    key {
      name = "vnetaddressspace"
      path = terraform.workspace == "default" ? "networking/configuration/globo-primary/net_info" : "networking/configuration/globo-primary/${terraform.workspace}/net_info"
    }
    key {
      name = "vm-size"
      path = terraform.workspace == "default" ? "networking/configuration/globo-primary/net_info" : "networking/configuration/globo-primary/${terraform.workspace}/net_info"
    }
    key {
      name = "subnet_count"
      path = terraform.workspace == "default" ? "networking/configuration/globo-primary/net_info" : "networking/configuration/globo-primary/${terraform.workspace}/net_info"
    }
    key {
      name = "instance_count"
      path = terraform.workspace == "default" ? "networking/configuration/globo-primary/net_info" : "networking/configuration/globo-primary/${terraform.workspace}/net_info"
    }
  
}