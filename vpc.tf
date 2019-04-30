resource "aws_vpc" "devops" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  tags {
    Name = "opsvpc"
  }
}
# ## Creating two public subnets
resource "aws_subnet" "ops-public-1" {
  vpc_id = "${aws_vpc.devops.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2a"
  tags {
    Name = "ops-public1"
  }
}

resource "aws_subnet" "ops-public-2" {
  vpc_id = "${aws_vpc.devops.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2b"
  tags {
    Name = "ops-public2"
  }
}
### Crating two private subnets
  resource "aws_subnet" "ops-private-1" {
    vpc_id = "${aws_vpc.devops.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch  = "false"
    availability_zone = "us-east-2a"
    tags {
      Name = "ops-private-1"
    }
  }
  resource "aws_subnet" "ops-private-2" {
    vpc_id = "${aws_vpc.devops.id}"
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-2b"
    tags {
      Name = "ops-private2"
    }
  }
## adding our internet gateway
resource "aws_internet_gateway" "ops-gateway" {
  vpc_id = "${aws_vpc.devops.id}"
  tags {
    Name = "opsvpc-gateway"
  }
}

resource "aws_route_table" "ops-rt" {
  vpc_id = "${aws_vpc.devops.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ops-gateway.id}"

}
}
#route association public
resource "aws_route_table_association" "ops-rt-1" {
  subnet_id = "${aws_subnet.ops-public-1.id}"
  route_table_id = "${aws_route_table.ops-rt.id}"
}
resource "aws_route_table_association" "ops-rt-2" {
  subnet_id = "${aws_subnet.ops-public-2.id}"
  route_table_id = "${aws_route_table.ops-rt.id}"
}
