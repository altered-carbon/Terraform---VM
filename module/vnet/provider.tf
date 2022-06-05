terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.2.0"
    }
      consul = {
          source  = "hashicorp/consul"
      version = "~>2.0"
  }
  }

}

provider "azurerm" {
  features {}
}

provider "consul" {
  address = "127.0.0.1:8500"
  datacenter = "server1"
}
