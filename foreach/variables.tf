variable "ami_id" {
  type = string
  default = "ami-0b4f379183e5706b9"
}

variable "instance_names" {
    type = map
    default = {
        mongodb = "t3.small"
        redis = "t2.micro"
        mysql = "t3.small"
        rabbitmq = "t2.micro"
        catalouge = "t2.micro"
        cart = "t2.micro"
        user = "t2.micro"
        payment = "t2.micro"
        shipping = "t2.micro"
        dispatch = "t3.small"
        web = "t2.micro"
    } 
}

variable "zone_id" {
  type = string
  default = "Z02917703TETMSTF0A6A6"
  # this value is from hosted zone id which is available at aws rout53.
}

variable "domain_name" {
  type = string
  default = "betterpractices.online"
}