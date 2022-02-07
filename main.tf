terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami             = "ami-01b996646377b6619"
  instance_type   = "t2.micro"
  user_data	= file("file.sh")
  key_name = "ChescaKeyPair"
  vpc_security_group_ids = ["sg-06e9c1f226191087f"]

  tags = {
    Name = "DockerServerInstance"
  }
}
