resource "aws_vpc" "my_vpc" {
  cidr_block = "${var.vpc_cidr}"
  tags = {
    Name = "tf-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    cidr_block = "${var.subnet_cidr}"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "IGW" {    
  vpc_id =  "${aws_vpc.my_vpc.id}"
 }

 
 resource "aws_route_table" "PublicRT" {    
    vpc_id = "${var.vpc_cidr}"
         route {
    cidr_block = "0.0.0.0/0"              
    gateway_id = "${aws_internet_gateway.IGW.id}"
     }
 }

resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = "${aws_subnet.my_subnet.id}"
    route_table_id = aws_route_table.PublicRT.id
 }

resource "aws_network_interface" "foo" {
  subnet_id   = "${aws_subnet.my_subnet.id}"
  private_ip = "${var.private_ip}"
 
 attachment {
   instance = ["${module.ec2.aws_instance.prodevans-rocks-sai}"]
   device_index = 1
 }
}





