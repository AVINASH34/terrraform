output "example_vpc_id" {
    value = aws_vpc.example_vpc[*].id
}