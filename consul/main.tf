#PROVIDER

terraform {
  required_providers {
    consul = {
      source  = "hashicorp/consul"
      version = "~>2.0"
    }
  }
}

provider "consul" {
  address    = "127.0.0.1:8500"
  datacenter = "server1"
}

#Creating KV

resource "consul_keys" "networking" {
  key {
    path  = "networking/state/"
    value = ""
  }
  key {
    path  = "networking/configuration/"
    value = ""
  }
}

resource "consul_keys" "applications" {
  key {
    path  = "applications/state/"
    value = ""
  }
  key {
    path  = "applications/configuration/"
    value = ""
  }
}


#Creating ACL Policies

resource "consul_acl_policy" "networking" {
  name  = "networking"
  rules = <<-RULE
  key_prefix "networking" {
      policy = "write"
  }
  session_prefix ""{
      policy = "write"
  }
  RULE
}


resource "consul_acl_policy" "applications" {
  name  = "applications"
  rules = <<-RULE
    key_prefix "applications"{
        policy = "write"
    }
    key_prefix "networking/configuration"{
        policy = "read"
    }
    session_prefix ""{
        policy = "write"
    }
RULE

}


resource "consul_acl_token" "Mary" {
  description = "ACL Token for Mary Moe"
  policies    = [consul_acl_policy.networking.name]
}

resource "consul_acl_token" "Sally" {
  policies    = [consul_acl_policy.applications.name]
  description = "ACL Token for Sally Sue"
}

#OUTPUT

output "mary_token_accessor_id" {
  value = consul_acl_token.Mary.id
}

output "sally_token_accessor_id" {
  value = consul_acl_token.Sally.id
}
