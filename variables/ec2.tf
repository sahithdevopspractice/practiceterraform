resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.robhoshop.id]

  tags = {
    Name = var.tags
  }
}

resource "aws_security_group" "robhoshop" {
  name        = var.sg-name
  description = var.sg-description
  #vpc_id      = aws_vpc.main.id

  tags = {
    Name = "robhoshop-aws"
  }

  ingress {
    description = "Allow All Ports"
    from_port = var.inbound-from-port
    to_port = 0
    protocol = "tcp"
    cidr_blocks = var.cidr_block
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

