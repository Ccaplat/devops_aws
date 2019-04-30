# KEY PAIR to use in order to connect to our instances
# Key needs to be created before using terraform ,ssh-key -f command

resource "aws_key_pair" "devops"{
  key_name = "devops"
  public_key = "${file("${var.public_key}")}"
}
