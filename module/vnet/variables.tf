variable "naming_prefix" {
  type        = string
  description = "Naming Prefix"
  default     = "TF"
}

variable "projectcode" {
  type        = string
  default     = "TERRAFORM"
  description = "Project Code for the deployment"
}

variable "billingcode" {
  type    = string
  default = "7517XXX"
}

variable "consul_address" {
  type = string
  default = "127.0.0.1"
  description = "Address Of Consul Server"
  
}

variable "consul_port" {
  type = number
  default = 8500
  description = "Consul Port Number"
}

variable "consul_datacenter" {
  type = string
  description = " Name of the consul datacenter"
  default = "server1"
}

