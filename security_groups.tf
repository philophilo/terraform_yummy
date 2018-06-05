resource "aws_security_group" "demo_backend_sg" {
    name = "demo_backend_sg"
    tags {
        Name = "demo_backend_sg"
    }
    description = "Connections for the api and database"
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "TCP"
        # security_groups = ["${aws_security_group.FrontEnd.id}"]
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "80"
        to_port     = "80"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "443"
        to_port     = "443"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "-1"
        to_port     = "-1"
        protocol    = "ICMP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "demo_nat_sg" {
    name = "demo_nat_sg"
    tags {
        Name = "demo_nat_sg"
    }
    description = "Connections for the nat instance"
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    ingress {
        from_port   = "80"
        to_port     = "80"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "443"
        to_port     = "443"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "-1"
        to_port     = "-1"
        protocol    = "ICMP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "demo_internal_alb_sg" {
    name = "demo_internal_alb_sg"
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "ICMP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "alb"
    }
}

resource "aws_security_group" "demo_frontend_alb_sg" {
    name = "demo_frontend_sg"
    tags {
        Name = "demo_frontend_sg"
    }
    description = "Connections for the frontend - react app"
    vpc_id = "${aws_vpc.demo_vpc_terraform.id}"
    ingress {
        from_port   = "80"
        to_port     = "80"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "443"
        to_port     = "443"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = "-1"
        to_port     = "-1"
        protocol    = "ICMP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
