resource "aws_instance" "operations_instance" {
 ami          =  "${lookup(var.AMIS, var.AWS_REGION)}"
 # two instances to be created
 count = 2
 instance_type = "t2.micro"
 root_block_device = {
   volume_type = "gp2"
   volume_size = 20
# if you want terraform to destroy instances comment the line below.
   delete_on_termination = false
 }

# Assigning to public subnet
 subnet_id = "${aws_subnet.ops-public-1.id}"
 # Assigning the to security group
 vpc_security_group_ids = ["${aws_security_group.ops-security.id}"]
 # assigning key to instance
 key_name = "${aws_key_pair.devops.id}"
 tags ={
   Name = "ec2-operations"
 }
}
