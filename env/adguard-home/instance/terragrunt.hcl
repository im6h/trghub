terraform {
  source = "../../../src/instance"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "ssh" {
  config_path = "../ssh_keys"
  // mock_outputs = {
  //   ssh_id = "fake-ssh-id"
  // }
}

dependency "vpc" {
  config_path = "../vpc"
  // mock_outputs = {
  //   vpc_id = "fake-vpc-id"
  // }
}

dependency "firewall" {
  config_path = "../firewall"
  // mock_outputs = {
  //   fwg = "fake-fwg-id"
  // }
}

dependency "script" {
  config_path = "../user_scripts"
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
    script_id         = dependency.script.outputs.script_id

    core    = local.ice.core
    ram     = local.ice.ram
    label   = local.ice.label
    backups = local.ice.backups
    tags    = local.ice.tags
    os_id   = local.ice.os_id
    kind    = local.ice.kind
  }
}
