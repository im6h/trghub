terraform {
  source = "../../../src/instance"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "ssh" {
  config_path = "../ssh_keys"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "firewall" {
  config_path = "../firewall"
}

locals {
  ice = include.root.inputs["ice"]
}


inputs = {
  api_key = include.root.inputs["api_key"]
  instance = {
    vpc_ids           = [dependency.vpc.outputs.vpc_id]
    ssh_keys          = [dependency.ssh.outputs.ssh_id]
    firewall_group_id = dependency.firewall.outputs.fwg

    core    = local.ice.core
    ram     = local.ice.ram
    label   = local.ice.label
    backups = local.ice.backups
    tags    = local.ice.tags
    os_id   = local.ice.os_id
    kind    = local.ice.kind 
  }


}
