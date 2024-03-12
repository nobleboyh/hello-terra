variable "REGION" {
  default = "ap-southeast-1"
}

variable "ZONE1" {
  default = "ap-southeast-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    "ap-southeast-1" : "ami-0123c9b6bfb7eb962"
    "ap-southeast-2" : "ami-0d6f74b9139d26bf1"
  }
}