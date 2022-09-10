terraform {
  required_version = ">= 1.1.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">= 2.9.5"
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



provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://192.168.255.175:8006/api2/json"
    pm_password = var.password
    pm_user = "root@pam"
    pm_otp = ""
}




resource "proxmox_vm_qemu" "cml2-terraform2" {
  name        = "cml2-terraform2"
  target_node = "pve"


  clone = "cml-template"
  full_clone = false

}
