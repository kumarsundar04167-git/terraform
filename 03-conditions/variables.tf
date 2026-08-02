variable "environment" {
    default = "dev"
    type = string
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

variable "ec2_tag" {
  type = map(any)
  default = {
    Name        = "terraform_demo"
    project     = "roboshop"
    environment = "dev"

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
  type    = list
  default = ["0.0.0.0/0"]


}
variable "sg_tags" {
  type = map(any)
  default = {
    Name        = "terraform_demo"
    project     = "roboshop"
    environment = "dev"
  }
}