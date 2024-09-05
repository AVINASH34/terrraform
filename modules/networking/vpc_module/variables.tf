variable "example_vpc_cidr" {
    type = list(string)
    default = ["192.168.0.0/16"]  
}

variable "example_vpc_tags" {
    type = list(string)
    default = [ "example_tag" ]
  
}