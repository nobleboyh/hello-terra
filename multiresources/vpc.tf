resource "aws_vpc" "hoang-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" : "hoang-vpc"
  }
}

resource "aws_subnet" "hoang-pub-1" {
  vpc_id                  = aws_vpc.hoang-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    "Name" : "hoang-pub-1"
  }
}

resource "aws_subnet" "hoang-pub-2" {
  vpc_id                  = aws_vpc.hoang-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    "Name" : "hoang-pub-2"
  }
}

resource "aws_subnet" "hoang-priv-1" {
  vpc_id                  = aws_vpc.hoang-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    "Name" : "hoang-priv-1"
  }
}

resource "aws_internet_gateway" "hoang-igw" {
  vpc_id = aws_vpc.hoang-vpc.id
  tags = {
    "Name" : "hoang-igw"
  }
}

resource "aws_route_table" "hoang-pub-rt" {
  vpc_id = aws_vpc.hoang-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hoang-igw.id
  }

  route {
    cidr_block = aws_vpc.hoang-vpc.cidr_block
    gateway_id = "local"
  }

  tags = {
    Name = "hoang-pub-rt"
  }
}

resource "aws_route_table" "hoang-priv-rt" {
  vpc_id = aws_vpc.hoang-vpc.id

  route {
    cidr_block = aws_vpc.hoang-vpc.cidr_block
    gateway_id = "local"
  }

  tags = {
    Name = "hoang-priv-rt"
  }
}


resource "aws_route_table_association" "hoang-rt-association1" {
  subnet_id      = aws_subnet.hoang-pub-1.id
  route_table_id = aws_route_table.hoang-pub-rt.id
}

resource "aws_route_table_association" "hoang-rt-association2" {
  subnet_id      = aws_subnet.hoang-pub-2.id
  route_table_id = aws_route_table.hoang-pub-rt.id
}

resource "aws_route_table_association" "hoang-rt-association3" {
  subnet_id      = aws_subnet.hoang-priv-1.id
  route_table_id = aws_route_table.hoang-priv-rt.id
}