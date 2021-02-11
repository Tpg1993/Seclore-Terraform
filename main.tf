provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}
module "ec2" {
  source      		   = "./ec2"
  key_name           	   = var.key_name
  instance_type            = var.instance_type
  ami_id      		   = var.ami_id
  azs        		   = var.azs
  subnets                  = "${module.vpc.public_subnets}"
  number_of_instances 	   = var.instance_count
  security_group	   =  "${module.MY-SG.Security_Group_ID}"
  instance_tag		   = var.ec2_tag
}

module "vpc" {
  source		   = "./vpc"
  vpc_cidr_block	   = var.vpc_cidr_block
  vpc_tag		   = var.my_vpc_tag
  subnets_cidr_block	   = var.subnet_cidr
  azs			   = var.azs
  subnet_tag		   = var.subnet_tag
  igw_tag		   = var.igw_tag
  route_table_tag	   = var.route_table
}

module "MY-SG" {
  source 		   = "./security_group"
  vpc_id 		   = "${module.vpc.vpc_id}"
  from_port 		   = var.from_port
  to_port   		   = var.to_port
  protocol 		   = var.protocol
  cidr_blocks 		   = var.SG_CIDR
  security_group_tag 	   = var.SG_tag
 }
