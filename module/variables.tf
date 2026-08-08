variable "environment" {
  type    = string
  default = "dev"
}

variable "project" {
  type    = string
  default = "roboshop"
}

variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"
}

variable "instances" {
  type    = list(any)
  default = ["mongodb", "redis", "rabbitmq", "mysql", "cart", "payment", "shipping", "catalogue", "user", "frontend"]
}

variable "cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "domain_name" {
  type    = string
  default = "devopsonline.online"
}

variable "hosted_zone" {
  default = "Z04246872QFC8QNNXAS1U"
  type    = string
}