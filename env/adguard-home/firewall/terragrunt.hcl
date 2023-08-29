terraform {
  source = "../../../src/firewall"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "groups" {
  config_path = "../firewall_group"
}

inputs = {
  api_key = include.root.inputs["api_key"]
  fwg_id  = dependency.groups.outputs.fwg_id
  rules   = include.root.inputs.rules
}
