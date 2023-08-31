resource "aws_vpc" "vpc" {
  cidr_block           = var.network_cidr_block
  enable_dns_hostnames = var.network_enable_dns_hostnames
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "sn_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_pub_cidr_block
  map_public_ip_on_launch = var.subnet_map_public_ip_on_launch
  availability_zone       = var.subnet_pub_availability_zone
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rt_public_To_sn_public" {
  subnet_id      = aws_subnet.sn_public.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_security_group" "sg_public" {
  name   = var.sg_public_name
  vpc_id = aws_vpc.vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TCP/80 from All"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}