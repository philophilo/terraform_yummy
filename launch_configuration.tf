resource "aws_launch_configuration" "demo_launch_conf" {
    image_id= "${var.frontend_ami}"
    instance_type = “t2.micro”
    security_groups = ["${aws_security_group.demo_frontend_sg.id}"]
    key_name = "${var.key_name}"
    lifecycle {
        create_before_destroy = true
    }
}
