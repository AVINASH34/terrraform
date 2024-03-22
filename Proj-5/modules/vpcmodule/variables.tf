variable "vpc_cidr_range" {
    type = string 
    default = "192.168.0.0/16"
}

variable "subnet_cidr_range" {
    type = string
}


variable "subnet_az" {
    type = list(string)
}

variable "subnet_tag" {
    type = list(string)
}