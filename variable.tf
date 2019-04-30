# Assigning our variables
variable "AWS_REGION" {
  default = "us-east-2"
}
variable "private_key" {
  default = "devops"
}
variable "public_key" {
  default = "devops.pub"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-2 = "ami-02bcbb802e03574ba" #centos

  }
}
