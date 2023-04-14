data "aws_subnets" "default_subnets" {
}


# data "aws_ami" "aws-linux-2-latest" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*"]
#   }
# }
# data "aws_ami_ids" "aws-linux-2-latest-ids" {
#   owners = ["amazon"]
# }
