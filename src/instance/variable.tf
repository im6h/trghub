variable "instance" {
  type = object({
    core              = string
    ram               = string
    label             = string
    backups           = string
    tags              = list(string)
    os_id             = number
    kind              = string
    ssh_keys          = list(string)
    vpc_ids           = list(string)
    firewall_group_id = string
  })

  validation {
    condition     = contains(["vc2", "vdc", "vhf", "vhp", "voc", "voc-g", "voc-c", "voc-m", "voc-s", "vcg"], var.instance.kind)
    error_message = "Allowed kind instance [vc2,vdc,vhf,vhp,voc,voc-g,voc-c,voc-m,voc-s,vcg]"
  }
}

variable "region" {
  type        = string
  description = "region"
}

variable "api_key" {
  type = string
}
