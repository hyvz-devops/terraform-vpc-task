resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
