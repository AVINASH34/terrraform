variable "aws_vpc_cidr" {
    type = string
    default = "192.168.0.0/16"
  
}

variable "aws_vpc_tags" {
    type = string 
    default = "trail_from_terraform_module"
  
}