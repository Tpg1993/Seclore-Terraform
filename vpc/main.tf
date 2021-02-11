resource "aws_vpc" "terra_vpc" {
	cidr_block = "${var.vpc_cidr_block}"
	tags = {
		Name = var.vpc_tag
	}
}
#IG
resource "aws_internet_gateway" "terra_igw" {
	vpc_id = "${aws_vpc.terra_vpc.id}"
	tags = {
		Name = var.igw_tag
	}
}

#subnets : public
resource "aws_subnet" "public" {
	count = "${length(var.subnets_cidr_block)}"
	vpc_id = "${aws_vpc.terra_vpc.id}"
	cidr_block = "${element(var.subnets_cidr_block,count.index)}" 
	availability_zone = "${element(var.azs,count.index)}"
    	map_public_ip_on_launch = true
	tags = {
		Name = var.subnet_tag
	}
}

#Route table: attach IG
resource "aws_route_table" "public_rt" {
	vpc_id = "${aws_vpc.terra_vpc.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.terra_igw.id}"
	}
	tags = {
		Name = var.route_table_tag
	}
}
#Route table association with public subnets
resource "aws_route_table_association" "association1" {
	count = "${length(var.subnets_cidr_block)}"
	subnet_id = "${element(aws_subnet.public.*.id,count.index)}"
	route_table_id = "${aws_route_table.public_rt.id}"
}
