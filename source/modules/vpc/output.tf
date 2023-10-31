output "load_balancer" {
  value = aws_lb.jmtfproject_lb.dns_name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet1" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2" {
  value = aws_subnet.public_subnet2.id
}

output "private_subnet" {
  value = aws_subnet.private_subnet.id
}

output "instance_sg" {
  value = aws_security_group.instance_sg.id
}
