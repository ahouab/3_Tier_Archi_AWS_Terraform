output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnets" {
  value = [
    aws_subnet.pub-sub1.id,
    aws_subnet.pub-sub2.id,
    aws_subnet.priv-sub1.id,
    aws_subnet.priv-sub2.id
  ]
}