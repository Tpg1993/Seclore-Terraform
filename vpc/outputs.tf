output "vpc_id" {
  description = "ID of created VPC"
  value = aws_vpc.terra_vpc.id
}
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}
