resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = var.instance_name == "MongoDB" ? "t2.micro" : "t3.small"
}