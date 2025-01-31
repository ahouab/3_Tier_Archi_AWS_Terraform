variable "subnets" {
  type = list(string)
}

variable "instance_count" {
  type = number
}

variable "instance_name" {
    type = string
  
}

variable "db_user" {
  type        = string
  description = "Database username"

}

variable "db_password" {
  type        = string
  description = "Database password"
  sensitive = true
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}
