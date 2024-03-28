resource "aws_vpc" "poc" {
    cidr_block = var.vpc_poc
    tags = {
      Name = "${terraform.workspace}-vpc"
    }
  
}