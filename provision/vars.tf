variable "REGION" {
  default = "ap-southeast-1"
}

variable "ZONE1" {
  default = "ap-southeast-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    "ap-southeast-1" : "ami-001440bcc4ddffcf1"
    "ap-southeast-2" : "ami-023eb5c021738c6d0"
  }
}

variable "user" {
  default = "ec2-user"
}