variable vpc_cidr_block {}
variable vpc_tag{}
variable "igw_tag" {}
variable "route_table_tag" {
	default = ""
}
variable "subnets_cidr_block" {
        type = "list"
}
variable "azs" {}
variable "subnet_tag" {}
