
output "ec2_describe" {
  value = aws_instance.raghus_instance.public_dns
}
output "vpc_id" {
  value = aws_default_vpc.default.id
}
