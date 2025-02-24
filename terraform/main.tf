terraform {
    required_version = "~> 1.10.1"
    backend "s3" {
        bucket         = "s3-pipecd-s3-backend"
        key            = "pipecd"
        region         = "ap-southeast-2"
        encrypt        = true
       
        dynamodb_table = "s3-pipecd-s3-backend"
        shared_credentials_file = "/etc/piped-secret/credentials"
    }
}

provider "aws" {
  region = "ap-southeast-2"
  shared_credentials_files = ["/etc/piped-secret/credentials"]
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical Ubuntu AWS account id
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "Hello PipeCD"
  }
}