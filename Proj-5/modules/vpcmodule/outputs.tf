output "my-vpc-id" {
    value = aws_vpc.My_vpc.id
  
}

output "subnet_ids" {
    value = length(aws_subnet.MY_SUBNET)
  
}