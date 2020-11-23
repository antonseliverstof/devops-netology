provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "web" {
  ami           = "ami-0d3f551818b21ed81"
  instance_type = local.web_instance_type_map[terraform.workspace]
  count = local.web_instance_count_map[terraform.workspace]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "AntonInstance"
  }
}

locals {
  web_instance_type_map = {
  stage = "t2.micro"
  prod = "t2.micro"
  }
  web_instance_count_map = {
    stage = 1
    prod = 2
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
