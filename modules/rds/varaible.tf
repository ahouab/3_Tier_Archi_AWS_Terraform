variable "db_user" {
  description = "Database username"
  type        = string
}


variable "db_password" {
  description = "Database password"
  type        = string
  sensitive =  true
}

variable "security_group" {
  description = "Security Group ID"
  type        = string
}

variable "subnet_group" {
  description = "List of subnet IDs for DB Subnet Group"
  type        = list(string)
}




# variable "env" {
#   description = "The environment (dev, qa, prod)"
#   type        = string
#   default = "dev"
# }
