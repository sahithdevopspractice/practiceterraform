resource "aws_instance" "web" {
    #count = 11
    #count = length(var.instance_names) # this will calculate the lenght of the list
    for_each = var.instance_names # for_each is loop condition
    ami = var.ami_id
    #instance_type = "t2.micro"-- this will assign all instances t2.micro
    instance_type = each.value # since we are implimenting for_each loop condition, when for each is exicuted it will give a value each

tags = {
    #Name = "web" since count to 11 will create 10 instance with same name
    #Name = var.instance_names[count.index] # here instances names will be assigned as we defined in the varibles.tf
    Name = each.key
}
}

# resource "aws_route53_record" "www" {
#   #count = 11
#   count = length(var.instance_names)
#   zone_id = var.zone_id
#   #name    = var.instance_names[count.index].betterpractices.online
#   name = "${var.instance_names[count.index]}.betterpractices.online" # interpolation
#   type    = "A"
#   ttl     = 1
#   #records = [aws_instance.web[count.index].private_ip] #Here we have to provide private ip address, how to get private id? form the output of aws_instance.web we will get the instance informarion count.index will take the private ip and will assign here. this will assign only private ip to all the records.
#   records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip] # this conditon will give public ip to web instance and remaing instances private ip
# }

resource "aws_route53_record" "web"{
    for_each = aws_instance.web
    zone_id = var.zone_id
    name = "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    records =[ each.key == "web" ? each.value.public_ip : each.value.private_ip ]
}

# output "instances_info" {
#   value = aws_instance.web
# }