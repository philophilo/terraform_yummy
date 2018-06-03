# external networking, Internet gateway
# Routing table

resource "aws_internet_gateway" "demo_igw_terraform" {
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    tags {
        Name = "demo_igw_terraform"
    }
}

resource "aws_default_route_table" "demo_main_rt_terraform" {
    default_route_table_id = "${aws_vpc.demo_vpc_terraform.default_route_table_id}"
    tags {
        Name = "demo_main_rt_terraform"
    }

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.demo_nat_terraform.id}"
    }
    depends_on = ["aws_instance.demo_nat_terraform"]
}

resource "aws_route_table" "demo_public_rt" {
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    tags {
        Name = "demo_public_rt_terraform"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.demo_igw_terraform.id}"
    }
    
}
