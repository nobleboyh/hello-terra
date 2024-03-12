provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "first-terra" {
  ami                    = "ami-0123c9b6bfb7eb962"
  instance_type          = "t2.micro"
  availability_zone      = "ap-southeast-1a"
  key_name               = "hoang-desktop"
  vpc_security_group_ids = ["sg-0066ca0a2213a2595"]
  tags = {
    "name" = "terra-instance"
    "proj" = "abc123"
  }
}