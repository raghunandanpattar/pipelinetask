# output "sec_grp_describe" {
#   value = aws_security_group.http_server_sg}
output "ec2_describe" {
  value = aws_instance.raghus_instance.public_dns
}
output "vpc_id" {
  value = aws_default_vpc.default.id
}
