
variable "fwg_id" {
  type = string
}

variable "api_key" {
  type    = string
  default = "api key"
}

variable "rules" {
  type = list(object({
    index      = number
    cidr_block = string
    port       = string
    protocol   = string
  }))
}
