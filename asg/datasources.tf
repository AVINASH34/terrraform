data "aws_ami" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240301"]

  }
}

data "aws_security_groups" "sg" {
  filter {
    name   = "tag:Name"
    values = ["sample"]
  }

}
