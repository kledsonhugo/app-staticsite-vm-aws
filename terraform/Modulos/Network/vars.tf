# VPC

variable "vpc_cidr_block {
    type    = string
    default = "10.0.1.0/24"
}
    
variable "vpc_dns_hostnames" {
    type    = bool
    default = true
}




