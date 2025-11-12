# provider "aws" {
#   region = "eu-north-1"
# }

# resource "aws_instance" "MY_INSTANCE_EC2" {
#   ami           = "ami-0c7d68785ec07306c" # Example AMI ID for eu-north-1
#   instance_type = "t3.micro"

#   tags = {
#     Name = "MyFirstTerraformEC2"
#   }
# }

# variables 
# provider "aws" {
#   region = var.aws_region
# }

# data "aws_ami" "amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }

# resource "aws_instance" "my_ec2_sameer" {
#   ami           = data.aws_ami.amazon_linux.id
#   instance_type = var.instance_type

#   tags = {
#     Name = var.instance_name
#   }
# }


# Conditional Expression $ locals

provider "aws" {
  region = var.aws_region
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

locals {
  name_tag = var.instance_type == "t3.micro" ? "Micro Instance" : "Standard Instance"
}

resource "aws_instance" "my_ec2_sameer" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tags = {
    Name = local.name_tag
  }
}