resource "aws_instance" "demo_backend_terraform" {
    ami = "${var.backend_ami}"
    instance_type = "t2.micro"
    associate_public_ip_address = "false"
    subnet_id = "${aws_subnet.demo_private_subnet_aza.id}"
    vpc_security_group_ids = ["${aws_security_group.demo_backend_sg.id}"]
    key_name = "${var.key_name}"
    tags {
        Name = "demo_backend_terraform"
    }
}

resource "aws_instance" "demo_nat_terraform" {
    ami = "${var.nat_ami}"
    instance_type = "t2.micro"
    associate_public_ip_address = "true"
    subnet_id = "${aws_subnet.demo_public_subnet_aza.id}"
    vpc_security_group_ids = ["${aws_security_group.demo_nat_sg.id}"]
    key_name = "${var.key_name}"
    source_dest_check = "false"
    tags {
        Name = "demo_nat_terraform"
    }
}

resource "aws_instance" "demo_frontend_terraform" {
    ami = "${var.frontend_ami}"
    instance_type = "t2.micro"
    associate_public_ip_address = "true"
    subnet_id = "${aws_subnet.demo_public_subnet_aza.id}"
    vpc_security_group_ids = ["${aws_security_group.demo_frontend_alb_sg.id}"]
    key_name = "${var.key_name}"
    tags {
        Name = "demo_frontend_terraform"
    }
}

resource "aws_instance" "demo_database_terraform" {
    ami = "${var.database_ami}"
    instance_type = "t2.micro"
    associate_public_ip_address = "false"
    subnet_id = "${aws_subnet.demo_private_subnet_aza.id}"
    vpc_security_group_ids = ["${aws_security_group.demo_backend_sg.id}"]
    key_name = "${var.key_name}"
    tags {
        Name = "demo_backend_terraform"
    }
    private_ip = "${var.database_ip}"
}
