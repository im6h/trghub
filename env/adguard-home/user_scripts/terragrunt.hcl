terraform {
  source = "../../../src/user_scripts"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  script_name = include.root.inputs.script.name
  api_key = include.root.inputs["api_key"]
}
