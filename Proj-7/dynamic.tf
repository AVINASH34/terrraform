variable "poc_sg" {
   type = map(object({
     port = number
     protocol = string
     cidr_blocks = list(string) 
   }))
   default = {
     "ssh" = {
      port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
       
     }
     https = {
      port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
     }
   }
}


resource "aws_security_group" "my_security_group" {
  description = " This is set to poc of dynamic block "
  name = " poc_subnet_group "
  egress {
     from_port        = 0
     to_port          = 0
     protocol         = "-1"
     cidr_blocks      = ["0.0.0.0/0"]
     ipv6_cidr_blocks = ["::/0"]
  }
  dynamic "ingress" {
    for_each = var.poc_sg
    content {
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
    
  }
}