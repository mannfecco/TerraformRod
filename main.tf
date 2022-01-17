#this willl be the the srcurity group of our basion host




resource "aws_vpc" "app_Vpc" {
  cidr_block       = var.vpcCidr

  tags = {
    Name = "My_Vpc"
  }
}



resource "aws_security_group" "web_SG" {
  name        = "bation_SG"
  description = "allow traffic from my Ip"
  vpc_id      = aws_vpc.app_Vpc.id

  ingress {
    description      = "my ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["108.50.239.218/32"]

  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "-1"
    cidr_blocks      = ["108.50.239.218/32"]
  }

  tags = {
    Name = "my_bation_SG"
  }
}

#this is going to be our security group for the web servers

resource "aws_security_group" "web_Server_sg" {
  name        = "bation_SG"
  description = "allow traffic from 443/80"
  vpc_id      = aws_vpc.app_Vpc.id

  ingress {
    description      = "everywhere"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

ingress {
    description      = "everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_bation_SG"
  }
}

