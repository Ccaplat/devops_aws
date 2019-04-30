output "instances" {
  value = "${aws_instance.operations_instance.*.public_ip}"
}
#Name of bucket for Kubernetes to store state files
output "aws_s3_bucket" {
value = "${aws_s3_bucket.opscloudbucket.id}"
}
