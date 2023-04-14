
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAYBUDLFUTXU7MZNWB"
  secret_key = "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"
}
resource "aws_default_vpc" "default"{

}


resource "aws_security_group" "raghu_sg" {
  name   = "raghu_sg"
  vpc_id = aws_default_vpc.default.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    "name" = "raghus_sg"
  }

}
resource "aws_instance" "raghus_instance" {
  ami                    = "ami-06e46074ae430fba6"
  key_name               = "default-ec2"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.raghu_sg.id]
  subnet_id              = tolist(data.aws_subnets.default_subnets.ids)[5]

 
}


