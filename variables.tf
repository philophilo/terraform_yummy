variable "backend_ami" {
    default = "ami-0b59e7d13bf0c25fc"
}

variable "frontend_ami" {
    default = "ami-0f317f1624c76daeb"
}

variable "nat_ami" {
    default = "ami-0cae74fb86af18456"
}

variable "database_ami" {
    default = "ami-052866c2d219d00b2"
}

variable "vpc_fullcidr" {
    default = "10.0.0.0/16"
    description = "the vpc cidr"
}

variable "subnet_public_aza_cidr" {
    default = "10.0.1.0/24"
    description = "The cidr of the public subnet in zone a"
}

variable "subnet_public_azb_cidr" {
    default = "10.0.3.0/24"
    description = "The cidr of the public subnet in zone b"
}

variable "subnet_private_aza_cidr"{
    default = "10.0.2.0/24"
    description = "The cidr of the private subnet in zone a"
}

variable "subnet_private_azb_cidr"{
    default = "10.0.4.0/24"
    description = "The cidr of the private subnet in zone b"
}

#variable "dns_zone_name" {
#    default = "philophilo.xyz"
#    description = "internal dns name"
#}

variable "key_name" {
    default = "ansible-key"
    description = "the ssh key to use in the EC2 instances"
}
