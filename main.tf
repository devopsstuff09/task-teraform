module "my_vpc" {

source = "./modules/vpc"
vpc_cidr = "172.31.0.0/16"
subnet_cidr = "172.31.20.0/24"
#priavte_ip = "172.31.20.59"
}

module "my_ec2" {

source = "./modules/ec2"
instance_type = "t2.micro"


}



