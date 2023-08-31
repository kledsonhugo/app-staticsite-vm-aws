# VPC

variable "vpc_cidr" {
    type    = string
    default = "10.0.0.0/16"
}    
    
variable "vpc_dns_hostnames" {
    type    = bool
    default = true
}

  variable "ec2_ami" {
    type    = string
    default = "ami-02e136e904f3da870"

    }

     variable ec2_instance_type" {
    type    = string
    default = "t3.micro"

     }    
    