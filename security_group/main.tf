resource "aws_security_group" "terra-sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port = var.from_port
    protocol = var.protocol
    to_port = var.to_port
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.security_group_tag
  }
}
