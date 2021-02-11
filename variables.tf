variable "access_key" {}

variable "secret_key" {}

variable "region" {
  default = "ap-south-1"
}

##############  Variables For EC2 ###########
variable "key_name" {}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-085eb5b181ec4ae5b"
}

variable "azs" {
  default = ["ap-south-1b"]
}
variable "instance_count" {
  default = "1"
}

variable "ec2_tag" {
  default = "Seclore-EC2"
}

################ Variables for VPC ##############
variable "my_vpc_tag" {
  default = "Seclore_vpc"
}

variable "vpc_cidr_block" {
  default = "10.20.0.0/16"
}

variable "subnet_tag" { 
  default = "Seclore-public-subnet"
}

variable "igw_tag" {
  default = "Seclore-IGW"
}

variable "route_table" {
  default = "Seclore-Route-Table"
}

variable "subnet_cidr" {
  default = ["10.20.1.0/24"]
}
# variable "azs" {
#   default = ["ap-south-1b]
#}

################## Variables for Decurity Group #########

variable "from_port" {
  default = 22
}

variable "to_port" {
  default = 22
}

variable "protocol" {
  default = "tcp"
}

variable "SG_CIDR" {
  default = ["0.0.0.0/0"]
}

variable "SG_tag" {
  default = "Seclore-SG"
}
