provider "aws" {
    region = "us-east-2"
}

resource "aws_vpc" "demo_vpc_terraform" {
    cidr_block = "${var.vpc_fullcidr}"
    #### internal vpc dns resolution
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
        Name = "demo_vpc_terraform"
    }
}
