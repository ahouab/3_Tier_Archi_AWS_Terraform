variable "cidr_block" {
#  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  default = "my-vpc"
}

variable "subnets" {
  type    = list(string)
  
}

variable "availability_zones" {
  type    = list(string)
 
}

