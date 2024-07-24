variable "ami_id" {
  type = string
  default = "value"
}

variable "instance_names" {
  type = list
  default = ["mongodb","redis","mysql","rabbitmq","catalouge","user","cart","shipping","payment","dispatch","web"]
}

variable "zone_id" {
  type = string
  default = "Z02917703TETMSTF0A6A6"
}