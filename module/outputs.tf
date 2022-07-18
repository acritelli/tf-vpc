output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_ids" {
  value = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_2.id
  ]
}

output "availability_zones" {
  value =[
    aws_subnet.subnet_1.availability_zone,
    aws_subnet.subnet_2.availability_zone
  ]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "agents_security_group_id" {
  value = aws_security_group.agents_security_group.id
}
