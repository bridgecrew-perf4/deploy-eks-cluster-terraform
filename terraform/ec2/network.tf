resource "aws_internet_gateway" "challenge-igw" {
    vpc_id = aws_vpc.vpc-challenge.id
    tags = {
        Name = "challenge-igw"
    }
}

resource "aws_route_table" "challenge-public-crt" {
    vpc_id = aws_vpc.vpc-challenge.id
    
    route {
        cidr_block = "0.0.0.0/0"      
        gateway_id = aws_internet_gateway.challenge-igw.id
    }
    tags = {
      "Name" = "challenge-public-crt"
    }
}

resource "aws_route_table_association" "challenge-crta-public-subnet"{
    subnet_id = aws_subnet.challenge-subnet-public.id
    route_table_id = aws_route_table.challenge-public-crt.id
}

resource "aws_security_group" "ssh-allowed" {
    name = "ssh-allowed"
    description = "Allow SSH inbound traffic"
    vpc_id = aws_vpc.vpc-challenge.id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"        
        cidr_blocks = ["0.0.0.0/0"]
    }
      
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        Name = "ssh-allowed"
  }
}