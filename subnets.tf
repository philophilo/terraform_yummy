resource "aws_subnet" "demo_public_subnet_aza" {
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    cidr_block = "${var.subnet_public_aza_cidr}"
    tags {
        Name = "demo_public_aza"
    }
    availability_zone = "us-east-2a"
}

resource "aws_subnet" "demo_public_subnet_azb" {
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    cidr_block = "${var.subnet_public_azb_cidr}"
    tags {
        Name = "demo_public_subnet_azb"
    }
    availability_zone = "us-east-2b"
}

resource "aws_subnet" "demo_private_subnet_aza" {
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    cidr_block = "${var.subnet_private_aza_cidr}"
    tags {
        Name = "demo_private_aza"
    }
    availability_zone = "us-east-2a"
}

resource "aws_subnet" "demo_private_subnet_azb" {
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    cidr_block = "${var.subnet_private_azb_cidr}"
    tags {
        Name = "demo_private_azb"
    }
    availability_zone = "us-east-2b"
}
