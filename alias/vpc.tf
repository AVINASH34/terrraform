 terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "primary"
}

provider "aws" {
  region = "us-east-1"
  alias  = "secondary"
}

resource "aws_vpc" "primary_vpc" {
  provider  = aws.primary
  cidr_block = "192.168.0.0/16"
}

resource "aws_vpc" "secondary_vpc" {
  provider  = aws.secondary
  cidr_block = "10.0.0.0/16"
}

output "primary_vpc_id" {
  value = aws_vpc.primary_vpc.id
}

output "secondary_vpc_id" {
  value = aws_vpc.secondary_vpc.id
}