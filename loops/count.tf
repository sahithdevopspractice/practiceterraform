resource "aws_instance" "web" {
    #count = 11
    count = length(var.instance_names) # this will calculate the lenght of the list
    ami = var.ami_id
    #instance_type = "t2.micro"-- this will assign all instances t2.micro
    instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"

tags = {
    #Name = "web" since count to 11 will create 10 instance with same name
    Name = var.instance_names[count.index] # here instances names will be assigned as we defined in the varibles.tf
}
}

resource "aws_route53_record" "www" {
  #count = 11
  count = length(var.instance_names)
  zone_id = var.zone_id
  #name    = var.instance_names[count.index].betterpractices.online
  name = "${var.instance_names[count.index]}.betterpractices.online" # interpolation
  type    = "A"
  ttl     = 1
  #records = [aws_instance.web[count.index].private_ip] #Here we have to provide private ip address, how to get private id? form the output of aws_instance.web we will get the instance informarion count.index will take the private ip and will assign here. this will assign only private ip to all the records.
  records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip] # this conditon will give public ip to web instance and remaing instances private ip
}

