resource "aws_instance" "terra-ec2" {
  ami           	= var.ami_id
  count		 	= var.number_of_instances
  security_groups       = var.security_group
  subnet_id            = "${element(var.subnets, count.index )}"
  key_name		= var.key_name
  availability_zone 	= "${element(var.azs,count.index)}"
  instance_type 	= var.instance_type
  tags = {
    Name = var.instance_tag
  }
}
