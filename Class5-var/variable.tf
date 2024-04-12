variable "region" {
  type        = string
  description = "provide region"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr block"
}

variable "subnet_cidr" {
  type = list(object({
    cidr        = string
    subnet_name = string
  }))
}

variable "ip_on_launch" {
  type = bool
}