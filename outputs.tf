output "instance_public_ip_addr" {
  value = module.ec2.*.instance_public_ip_addr
}

