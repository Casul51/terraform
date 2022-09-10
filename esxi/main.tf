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
  description = "The username for the master user"
  type        = string
}
variable "password" {
  description = "The password for the master user"
  type        = string
}



provider "esxi" {
#  esxi_hostname      =  var.ip
  esxi_hostname      =  "192.168.255.16"
#  esxi_hostport      = "4422"
  esxi_hostport      = "22"
#  esxi_hostssl       = "4483"
  esxi_hostssl       = "443"
  esxi_username      = var.username
  esxi_password      = var.password
}


resource "esxi_guest" "cml2-terraform" {
  guest_name         = "cml2-terraform"
  
  disk_store         = "datastore1"

#  boot_disk_type         = "thin"


#  numvcpus = "4"
#  memsize = "8192"

  clone_from_vm      = "cml2-template"
  
  boot_firmware          = "efi" 

  network_interfaces {
    virtual_network = "VM Network"
  }
#  power  			 = "on"
}
