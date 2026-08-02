resource "aws_instance" "terraform_demo" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
   vpc_security_group_ids = [aws_security_group.terraform_demo.id] 

  tags = {
    Name = "terraform_demo" 
    project = "roboshop"
    environment = "dev"

  }
}

resource "aws_security_group" "terraform_demo" {
  name        = "terraform_demo"
  description = "Allow TLS inbound traffic and all outbound traffic"
  
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform_demo"
    project = "roboshop"
    environment = "dev"
  }
}