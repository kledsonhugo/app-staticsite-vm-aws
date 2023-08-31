module "network" {
    source               = "./modules/network"
    vpc_cidr_block       = "${var.vpc_cidr_block}"
    vpc_dns_hostnames    = "${var.vpc_dns_hostnames}"

}

module "compute" {
     source              = "./modules/compute"
     ami                 = "${var.ec2_ami}
     instance_type       = "${var.ec2_instance_type}
}