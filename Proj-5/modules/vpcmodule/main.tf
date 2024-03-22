resource "aws_vpc" "My_vpc" {
    cidr_block = var.vpc_cidr_range
    tags = {
        "Name" = "VPC_FROM_TF"
    }
  
}

resource "aws_subnet" "MY_SUBNET" {
    count = length(var.subnet_az)
    vpc_id = aws_vpc.My_vpc.id
    cidr_block = cidrsubnet(var.vpc_cidr_range,8,count.index)
    availability_zone = var.subnet_az[count.index]
    tags = {
        "Name" = var.subnet_tag[count.index]
    }
}