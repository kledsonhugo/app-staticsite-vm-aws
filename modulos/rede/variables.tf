variable "network_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Network CIDR Block"
}

variable "network_enable_dns_hostnames" {
  type        = bool
  default     = true
  description = "Enable DNS Hostnames"
}

variable "subnet_pub_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "Public Subnet CIDR Block"
}

variable "subnet_map_public_ip_on_launch" {
  type        = bool
  default     = true
  description = "Public Subnet Map Public IP on Launch"
}

variable "subnet_pub_availability_zone" {
  type        = string
  default     = "us-east-1a"
  description = "Public Subnet Availability Zone"
}

variable "sg_public_name" {
  type        = string
  default     = "sg_public"
  description = "Public Security Group Name"
}
