resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
   tags = {
    Name = "MyVPC-${terraform.workspace}"
  }

}

resource "aws_subnet" "pub-sub1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnets[0]
  availability_zone       = var.availability_zones[0]

  tags = {
    Name = "PublicSub1-${terrafozrm.workspace}"
    
  }
}

resource "aws_subnet" "pub-sub2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnets[1]
  availability_zone       = var.availability_zones[1]

  tags = {
    Name = "PublicSub2-${terraform.workspace}"
    
  }
}

resource "aws_subnet" "priv-sub1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnets[2]
  availability_zone       = var.availability_zones[0]
  tags = {
    Name = "PrivateSub1-${terraform.workspace}"
    
  }
}

resource "aws_subnet" "priv-sub2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnets[3]
  availability_zone       = var.availability_zones[1]
  tags = {
    Name = "PrivateSub1-${terraform.workspace}"
    
  }
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
       Name = "MyIGW-${terraform.workspace}"

     }
  
}

resource "aws_route_table" "my_route" {
    vpc_id = aws_vpc.my_vpc.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }

    tags = {
    Name = "Route-${terraform.workspace}"
    
  }
  
}

resource "aws_route_table_association" "my_pub_route1" {
    subnet_id = aws_subnet.pub-sub1.id
    route_table_id = aws_route_table.my_route.id

  
  
}

resource "aws_route_table_association" "my_pub_rouute2" {
    subnet_id = aws_subnet.pub-sub2.id
    route_table_id = aws_route_table.my_route.id
  
  
}
