resource "aws_route_table_association" "demo_public_rt_aza" {
    subnet_id = "${aws_subnet.demo_public_subnet_aza.id}"
    route_table_id = "${aws_route_table.demo_public_rt.id}"
}

resource "aws_route_table_association" "demo_public_rt_azb" {
    subnet_id = "${aws_subnet.demo_public_subnet_azb.id}"
    route_table_id = "${aws_route_table.demo_public_rt.id}"
}

resource "aws_route_table_association" "demo_private_rt_aza" {
    subnet_id = "${aws_subnet.demo_private_subnet_aza.id}"
    route_table_id = "${aws_default_route_table.demo_main_rt_terraform.id}"
}

resource "aws_route_table_association" "demo_private_rt_azb" {
    subnet_id = "${aws_subnet.demo_private_subnet_azb.id}"
    route_table_id = "${aws_default_route_table.demo_main_rt_terraform.id}"
}
