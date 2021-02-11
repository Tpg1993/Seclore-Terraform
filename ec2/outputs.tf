output "instance_public_ip_addr" {
  value = aws_instance.terra-ec2.*.public_ip
}
