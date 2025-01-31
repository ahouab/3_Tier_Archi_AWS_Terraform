variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "security_group" {
  description = "Security group ID"
  type        = string
}

