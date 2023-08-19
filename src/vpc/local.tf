locals {
  vpn_subnet = split("/", var.vpc.cidr_block)
}
