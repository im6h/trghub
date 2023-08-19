output "instance_id" {
  value = vultr_instance.v_instance.id
}

output "public_ip" {
  value = vultr_instance.v_instance.main_ip
}

output "private_ip" {
  value = vultr_instance.v_instance.internal_ip
}
