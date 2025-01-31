resource "aws_db_subnet_group" "my_db_subnet_group" {
  name        = "my-db-subnet-group-${terraform.workspace}"
  description = "My DB Subnet Group"
  subnet_ids  = var.subnet_group  # Use the input variable

  tags = {
    Name = "My DB Subnet Group - ${terraform.workspace}"  # Add workspace/environment to the tags
  }
}

resource "aws_db_instance" "database" {
  identifier            = "mydatabase-${terraform.workspace}"
  allocated_storage     = 20
  engine                = "mysql"
  instance_class        = "db.t3.micro"
  username              = "dbuserprod"
  password              = var.db_password
  skip_final_snapshot   = true
  vpc_security_group_ids= [var.security_group]
  db_subnet_group_name  = aws_db_subnet_group.my_db_subnet_group.name
  
   tags = {
    Name        = "MyDatabase-${terraform.workspace}"  # Add workspace/environment to the tags
  }

  # vpc_security_group_ids = [var.security_group]
   
}
