variable "my_vpc_cidr" {
    type = string
    default = "192.168.0.0/24"
  
}

variable "my_subnet_cidr" {
    type = list(string)
  
}

variable "my_subnet_tag" {
    type = list(string)
  
}

variable "my_availability_zones" {
    type = list(string)
  
}