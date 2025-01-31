# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "5.84.0"
#     }
#   }
# }

# provider "aws" {
#   region = "ap-south-1"
# }

# module "vpc" {
#   source           = "./modules/vpc"
#   cidr_block       = "10.0.0.0/16"
#   subnets          = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
#   availability_zones = ["ap-south-1a", "ap-south-1b"]


# }


# module "security" {
#   source = "./modules/security"
#   vpc_id = module.vpc.vpc_id


# }

# module "s3" {
#   source       = "./modules/s3"
#   bucket_name  = "my-terraform-buckets"

# }


# module "rds" {
#   source         = "./modules/rds"
#   db_user        = "admin"
#   db_password    = "securepassword"
#   security_group = module.security.security_group_id
#   subnet_group   = module.vpc.subnets
  
# }

# module "ec2" {
#   source         = "./modules/ec2"
#   instance_count = 2
#   ami_id         = "ami-00bb6a80f01f03502"
#   instance_type  = "t2.micro"
#   subnet_ids     = module.vpc.subnets
#   security_group = module.security.security_group_id

# }


