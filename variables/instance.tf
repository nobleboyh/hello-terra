resource "aws_instance" "instance-test" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "hoang-desktop"
  vpc_security_group_ids = ["sg-0066ca0a2213a2595"]
  tags = {
    "Name" = "Terra"
  }
}