variable "vpc" {
  type = object({
    cidr_block = string
  })
}

variable "region" {
  type        = string
  description = "region"
}

variable "api_key" {
  type    = string
  default = "value"
}
