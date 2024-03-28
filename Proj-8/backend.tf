terraform {
  backend "s3" {
    bucket = "terraformbackend11560328"
    key = "poc"
    region = "us-east-1"
    dynamodb_table = "terraformbackend"
  }
}