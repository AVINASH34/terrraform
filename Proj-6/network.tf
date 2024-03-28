resource "aws_vpc" "activity-vpc" {
    count = length(var.activity_vpc_cidr)
    cidr_block = var.activity_vpc_cidr[count.index]

    tags = {
      Name = var.activity_vpc_tag[count.index]
    }
 }


resource "aws_subnet" "activity_subnet" {
  count            = length(var.activity_subnet_tag) * length(var.activity_vpc_cidr)
  vpc_id           = aws_vpc.activity-vpc[count.index % length(var.activity_vpc_cidr)].id
  cidr_block       = cidrsubnet(aws_vpc.activity-vpc[count.index % length(var.activity_vpc_cidr)].cidr_block, 8, count.index)

  availability_zone = var.activity_subnet_azs[count.index % length(var.activity_subnet_azs)]
  tags = {
    Name = var.activity_subnet_tag[count.index % length(var.activity_subnet_tag)]
  }
}
