terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
      	#VPN NEEDED for init
    }
  }
}

# export TF_VAR_username="username"
variable "username" {
  description = "The username for the DB master user"
  type        = string
}
variable "password" {
  description = "The password for the DB master user"
  type        = string
}

provider "esxi" {
#  esxi_hostname      = "esxi"
  esxi_hostname      = "84.17.21.146"
#  esxi_hostport      = "22"
#  esxi_hostssl       = "443"
  esxi_username      = var.username
  esxi_password      = var.password
}


resource "esxi_guest" "cml2-terraform-test" {
  guest_name         = "cml2-terraform-test"
  
  disk_store         = "datastore1"

#  numvcpus = "4"
#  memsize = "8192"
#  clone_from_vm      = "datastore1/cml1/cml240_rev2"
  clone_from_vm      = "cml240_rev2"

  network_interfaces {
    virtual_network = "VM Network"
  }
#  power  			 = "on"
}
