resource "vultr_firewall_rule" "v_fw_rule" {
  firewall_group_id = var.fwg_id
  for_each          = { for rule in var.rules : rule.index => rule }

  protocol    = lower(each.value.protocol)
  ip_type     = "v4"
  subnet      = split("/", each.value.cidr_block)[0]
  subnet_size = parseint(split("/", each.value.cidr_block)[1], 10)
  port        = each.value.port
  notes       = "ssh rule"
}
