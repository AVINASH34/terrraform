resource "aws_vpc" "myvpc" {
    cidr_block = var.my_vpc_cidr 
}

resource "aws_subnet" "mysubnet" {
    count = 3
    cidr_block = var.my_subnet_cidr[count.index]
    vpc_id = aws_vpc.myvpc.id
    availability_zone = var.my_availability_zones[count.index]
    tags = {
         "Name" = var.my_subnet_tag[count.index]
         
        }

}   