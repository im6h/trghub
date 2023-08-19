resource "vultr_ssh_key" "v_ssh_key" {
  name    = "v_ssh_key"
  ssh_key = var.ssh_key
}
