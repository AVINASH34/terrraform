resource "aws_vpc" "example_vpc" {
    count = length(var.example_vpc_cidr)
    cidr_block = var.example_vpc_cidr[count.index]
    tags = {
      Name = var.example_vpc_tags[count.index]
    }
}