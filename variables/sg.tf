resource "aws_security_group" "robhoshop-all" {
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
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}