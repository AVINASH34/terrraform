resource "aws_vpc" "vpc_us_east" {
     cidr_block = var.vpc_cidr
     tags = {
        "Name" = "vpc_tf"
     }
}

resource "aws_subnet" "subnet_us_east" {
    count = length(var.subnet_tag)
    vpc_id = aws_vpc.vpc_us_east.id
    cidr_block = cidrsubnet(var.vpc_cidr,8,count.index)
    availability_zone = var.az_us_east[count.index]
    tags = {
      "Name" = var.subnet_tag[count.index]
    }

    
  
}