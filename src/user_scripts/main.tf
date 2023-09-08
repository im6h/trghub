resource "vultr_startup_script" "adguard_home_script" {
  name   = var.script_name
  script = filebase64("./adguard.sh")
  type   = "boot"
}
