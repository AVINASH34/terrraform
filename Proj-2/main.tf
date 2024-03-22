resource "aws_vpc" "my_vpc" {
    cidr_block = var.my_vpc_cidr
    tags = {
        Name = "vpc-from-tf"
    }
  
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet1_cidr
    tags = {
       Name = "subnet1-from-tf"
    }
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet2_cidr
    tags = {
       Name = "subnet2-from-tf"
    }
}

resource "aws_subnet" "subnet3" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet3_cidr
    tags = {
       Name = "subnet3-from-tf"
    }
}

resource "aws_subnet" "subnet4" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet4_cidr
    tags = {
       Name = "subnet4-from-tf"
    }
}

resource "aws_subnet" "subnet5" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet5_cidr
    tags = {
       Name = "subnet5-from-tf"
    }
}

resource "aws_subnet" "subnet6" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet6_cidr
    tags = {
       Name = "subnet6-from-tf"
    }
}