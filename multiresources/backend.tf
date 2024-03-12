terraform {
  backend "s3" {
    bucket = "nobleboyh-terra-state"
    key = "terraform/backend"
    region = "ap-southeast-1"
  }
}