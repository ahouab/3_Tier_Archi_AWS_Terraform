terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = [var.security_group]

  tags = {
  Name = "web-instance-${terraform.workspace}"
}
}


# resource "aws_autoscaling_group" "web" {
#   launch_configuration = aws_launch_configuration.web.id
#   min_size             = 2
#   max_size             = 5
  
# }

# resource "aws_alb" "main" {
#   name               = "web-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [var.security_group]
#   subnets           =  var.subnet_ids  # Now using the subnet IDs from EC2 module
# }
