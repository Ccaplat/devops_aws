resource "aws_security_group" "ops-security" {
  vpc_id = "${aws_vpc.devops.id}"
  name = "allow ports"
  description = " security group for devops"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Opening port 8000 to 8500 , in real world environment, assigning only ports that we need to use
ingress {
  from_port = 8000
  to_port = 8500
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
# Kubernetes uses ports 30000 and above , this gives kubernetes plenty of ranges to test our deployments.
# In real world only open dedicated ports
ingress {
  from_port = 30000
  to_port = 31000
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
tags{
  Name = "opsvpc-security group"
 }
}
