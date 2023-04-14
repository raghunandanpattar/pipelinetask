
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

  # connection {
  #   type        = "ssh"
  #   host        = self.public_ipr
  #   user        = "ec2-user"
  #   private_key = file(var.aws_key_pair)
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo yum install httpd -y",
  #     "sudo service httpd start",
  #     "echo Hey ashutosh , this is my first ec2 instance  ${self.public_dns}| sudo tee /var/www/html/index.html"
  #   ]
  # }
}


resource "aws_s3_bucket" "raghus-bucket-89511" {
  bucket = "raghus-bucket-89511"
  acl = "private"
}

# resource "aws_s3_bucket_policy" "raghus-bucket-89511" {
#   bucket = "aws_s3_bucket.raghus-bucket-89511"

#   policy = jsonencode({
#     version = "2012-10-17"
#     Statement=[
#       {
#         Action =[
#           "s3.GetObject"
#         ]
#         Effect ="Allow"
#         Resource = "${aws_s3_bucket.raghus-bucket-89511.arn}/*"
#         Principal ={
#           Service ="ec2.amazonaws.com"
#         }
#         Condition ={
#           StringEquals={
#             "aws:sourceVpc":"vpc-05c8d369712b48906"
#           }
#         }
#       }
#     ]
#   })
  
# }

