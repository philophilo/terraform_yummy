resource "aws_eip" "demo_eip_terraform" {
    vpc = true
}

resource "aws_eip_association" "demo_eip_assoc_nat" {
  instance_id   = "${aws_instance.demo_nat_terraform.id}"
  allocation_id = "${aws_eip.demo_eip_terraform.id}"
}
