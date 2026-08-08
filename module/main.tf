resource "aws_instance" "roboshop" {
  count         = length(var.instances)
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [
    aws_security_group.roboshop[count.index].id,
  aws_security_group.common.id]


  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "roboshop" {
  count       = length(var.instances)
  name        = "${var.project}-${var.environment}-${var.instances[count.index]}"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_security_group" "common" {
  name        = "${var.project}-${var.environment}-common"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "${var.project}-${var.environment}-common"
  }

  lifecycle {
    create_before_destroy = true
  }
}