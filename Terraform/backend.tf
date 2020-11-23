terraform {
  backend "s3" {
    bucket = "anton.seliverstof1"
    encrypt = true
    key    = "global/s3/terraform.tfstate"
    region = "eu-west-3"
  }
}