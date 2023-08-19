terraform {
  source = "../../../src/vpc"
}

include {
  path = find_in_parent_folders()
  expose = true
}

// inputs = {
  // vpc = {
  //   cidr_block = include.root["cidr_block"]
  // }
// }
