resource "aws_ebs_volume" "hoang-ebs" {
  availability_zone = var.ZONE1
  size              = 2
}

resource "aws_volume_attachment" "attach_ebs-hoang" {
  volume_id   = aws_ebs_volume.hoang-ebs.id
  instance_id = aws_instance.terra-provision-ins.id
  device_name = "/dev/xvdh"
}