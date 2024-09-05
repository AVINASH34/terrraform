resource "aws_instance" "inst_for_asg" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = data.aws_security_groups.sg.ids
    user_data = "${file("install.sh")}"
    tags = {
      Name = "instance_from_tf"
    }
}

resource "aws_ami_from_instance" "ami_for_asg" {
       name = "my-ami-for-asg"
       source_instance_id = aws_instance.inst_for_asg.id
       tags = {
         Name = "myami"
       }
}

resource "aws_launch_template" "lt_for_asg" {
     name = "launch-temp-for-asg"
     description = " launch template for asg "
     image_id = aws_ami_from_instance.ami_for_asg.id
     instance_type = "t2.micro"
     key_name = var.key_name
     vpc_security_group_ids =  data.aws_security_groups.sg.ids
     tags = {
       Name = "mylt"
     }
}

resource "aws_autoscaling_group" "my_asg" {
    name = "my_asg_from_terraform"
    desired_capacity = 1
    max_size = 1
    min_size = 1
    availability_zones = ["us-east-1a","us-east-1b"]
    launch_template {
      id = aws_launch_template.lt_for_asg.id
      version = "$Latest"
    }
}