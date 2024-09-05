provider "aws" {
  region = "ap-south-1"

}

data "aws_ami" "ubuntu" {


  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240301"]
  }

}

resource "aws_internet_gateway" "igwforubuntu" {
  tags = {
    Name = "igwforubuntu"
  }

}

resource "aws_vpc" "vpcforubuntu" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ubuntu-vpc"
  }

}

resource "aws_internet_gateway_attachment" "igwattach" {
  internet_gateway_id = aws_internet_gateway.igwforubuntu.id
  vpc_id              = aws_vpc.vpcforubuntu.id
  depends_on          = [aws_internet_gateway.igwforubuntu, aws_vpc.vpcforubuntu]

}

resource "aws_route" "routeforubuntu" {
  route_table_id         = aws_vpc.vpcforubuntu.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igwforubuntu.id
  depends_on             = [aws_internet_gateway.igwforubuntu, aws_vpc.vpcforubuntu]

}

resource "aws_subnet" "ubuntusubnet" {
  vpc_id     = aws_vpc.vpcforubuntu.id
  cidr_block = "192.168.1.0/24"
  tags = {
    Name = "ubuntu-subnet"
  }
  depends_on = [aws_vpc.vpcforubuntu]

}

resource "aws_security_group" "ubuntusg" {
  vpc_id = aws_vpc.vpcforubuntu.id

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"

  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}



resource "aws_instance" "ubuntu" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "avinash"
  vpc_security_group_ids      = [aws_security_group.ubuntusg.id]
  subnet_id                   = aws_subnet.ubuntusubnet.id
  provisioner "remote-exec" {

    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
        host = aws_instance.ubuntu.public_ip 
      }
    inline = [
      " sudo apt update ",
      " mkdir hello "
    ]

  }
  depends_on = [data.aws_ami.ubuntu]
}

output "ubuntu-ami" {
  value = data.aws_ami.ubuntu.id

}

output "public-ip" {
  value = aws_instance.ubuntu.public_ip

}
