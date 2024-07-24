variable "ami_id" {
  type = string
  default = "ami-0b4f379183e5706b9"
}

variable "instance_names" {
    type = list
    default = ["mongodb","redis","mysql","rabbitmq","catalouge","user","cart","shipping","payment","dispatch","web"]
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