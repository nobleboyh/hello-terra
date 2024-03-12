resource "aws_security_group" "hoang-sg" {
  name        = "hoang-sg"
  description = "Allow ssh and http 80 from my ip"
  vpc_id      = aws_vpc.hoang-vpc.id

  tags = {
    Name = "allow ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.hoang-sg.id
  cidr_ipv4         = var.MYIP
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.hoang-sg.id
  cidr_ipv4         = var.MYIP
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.hoang-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}