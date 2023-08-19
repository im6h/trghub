resource "vultr_instance" "v_instance" {
  region            = var.region
  plan              = join("-", [var.instance.kind, var.instance.core, var.instance.ram])
  label             = var.instance.label
  backups           = var.instance.backups
  tags              = var.instance.tags
  os_id             = var.instance.os_id
  enable_ipv6       = false
  activation_email  = false
  ssh_key_ids       = var.instance.ssh_keys
  vpc_ids           = var.instance.vpc_ids
  firewall_group_id = var.instance.firewall_group_id
}
