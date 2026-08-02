resource "aws_instance" "terraform_demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.terraform_demo.id]

  tags = var.ec2_tag
}
resource "aws_security_group" "terraform_demo" {
  name        = var.sg_group
  description = "Allow TLS inbound traffic and all outbound traffic"


  egress {
    from_port   = var.port
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr
  }
  tags = var.sg_tags
}
