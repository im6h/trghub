terraform {
  source = "../../../src/vpc"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  vpc = {
    cidr_block = include.root.inputs.vpc.cidr_block
  }
  api_key = include.root.inputs["api_key"]
}
