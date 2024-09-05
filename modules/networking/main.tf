module "vpc_module" {
    source = "./vpc_module"
    
    example_vpc_cidr = [var.aws_vpc_cidr]
    example_vpc_tags = [var.aws_vpc_tags]
  
}