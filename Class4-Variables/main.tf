provider aws {
    region = var.region
}

resource "aws_instance" "web" {
  ami = var.ami_id
#   ami           = "ami-0900fe555666598a2"
  instance_type = var.type
}


variable ami_id {
    description = "provide im id"
    default = ""
    type = string
}

variable type {
    description = "instance type"
    default = ""
    type = string
}

variable region {
    description = "provide region"
    default = ""
    type = string
}