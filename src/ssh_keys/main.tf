resource "vultr_ssh_key" "v_ssh_key" {
  name    = var.ssh_name
  ssh_key = var.ssh_key
}
