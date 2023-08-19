terraform {
  source = "../../../src/firewall_group"
}

include "root" {
  path = find_in_parent_folders()
  expose = true
}

inputs = {
  api_key = include.root.inputs["api_key"]
}