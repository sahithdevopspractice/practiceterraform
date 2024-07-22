resource "aws_instance" "web" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2_instance"
  }
}

resource "aws_security_group" "robhoshop" {
  name        = "robhoshop-aws"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id

  tags = {
    Name = "robhoshop-aws"
  }

  ingress {
    description = "Allow All Ports"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

