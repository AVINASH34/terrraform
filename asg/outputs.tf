output "my-ami" {
    value = aws_ami_from_instance.ami_for_asg.id
}

output "my-lt" {
    value = aws_launch_template.lt_for_asg.id
  
}