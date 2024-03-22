variable "vpc_cidr" {
    type = string
    default = "192.168.0.0/16"
}

variable "subnet_tag" {
    type = list(string)  
}

variable "az_us_east" {
    type = list(string)
}