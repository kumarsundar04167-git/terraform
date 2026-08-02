variable "environment" {
  default = "dev"
  type    = string
}
variable "project" {
  default = "roboshop"
  type    = string
}

variable "ami_id" {
  type        = string
  description = "RHEL9 joindevops image"
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3,small"], var.instance_type)
    error_message = "Instance type should be either t3.micro or t3.small"
  }
}


variable "sg_group" {
  type    = string
  default = "terraform_demo"

}

variable "port" {
  type    = number
  default = 0
}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]


}
variable "instances" {
  default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
  type    = list(any)
}

variable "zone_id" {
  default = "Z04246872QFC8QNNXAS1U"
}

variable "domain_name" {
  default = "devopsonline.online"
}