provider "aws" {
    region = "us-east-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["golden-image*"]
  }

  owners = ["self"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.deployer.key_name
  count = 1
  user_data = file("apache.sh")
  user_data_replace_on_change = true

  # subnet_id = "subnet-087ce3228c402b726"
#   availability_zone = "us-east-2b"


  # tags = {
  #   Name = "HelloWorld"
  #   team = "devops"
  #   enviroment = "dev"
  #   project = "pizdec"
  # }

  tags = local.common_tags
}

output akunamatata {
  value = aws_instance.web[*].public_ip

}
