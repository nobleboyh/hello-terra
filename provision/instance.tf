resource "aws_key_pair" "terra-key" {
  key_name   = "terra"
  public_key = file("terra-key.pub")
}

resource "aws_instance" "terra-provision-ins" {
  ami                    = var.AMIS[var.REGION]
  availability_zone      = var.ZONE1
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = ["sg-0066ca0a2213a2595"]
  tags = {
    "Name" = "Terra-Provision"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.user
    private_key = file("terra-key")
    host        = self.public_ip
  }
}

output "publicIP" {
    value = aws_instance.terra-provision-ins.public_ip
}