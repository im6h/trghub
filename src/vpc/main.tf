resource "vultr_vpc" "this" {
  region         = var.region
  v4_subnet      = local.vpn_subnet[0]
  v4_subnet_mask = parseint(local.vpn_subnet[1], 10)
}
