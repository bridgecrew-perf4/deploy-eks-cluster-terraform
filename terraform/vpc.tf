resource "aws_vpc" "vpc-challenge" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-challenge"
  }
}

resource "aws_subnet" "challenge-subnet-public" {
  vpc_id     = aws_vpc.vpc-challenge.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "eu-west-1a"
  
  tags = {
    Name = "challenge-subnet-public"
  }
}