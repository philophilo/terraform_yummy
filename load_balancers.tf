# Application Load Balancer
resource "aws_alb" "demo_internal_alb" {
    name = "demo-internal-alb"
    internal = false
    security_groups = ["${aws_security_group.demo_internal_alb_sg.id}"]
    subnets = ["${aws_subnet.demo_public_subnet_aza.id}", "${aws_subnet.demo_public_subnet_azb.id}"]
    tags {
        Name = "demo_internal_alb"
    }
}

resource "aws_alb_listener" "internal_alb_listener" {
    load_balancer_arn = "${aws_alb.demo_internal_alb.arn}"
    port = "80"
    protocol = "HTTP"
    default_action {
        target_group_arn = "${aws_alb_target_group.internal_target_group.arn}"
        type = "forward"
    }
}

resource "aws_alb" "demo_frontend_alb" {  
    name = "demo-front-alb"  
    subnets = ["${aws_subnet.demo_public_subnet_aza.id}", "${aws_subnet.demo_public_subnet_azb.id}"]
    security_groups = ["${aws_security_group.demo_frontend_alb_sg.id}"]
    internal = "false"  
    tags {    
        Name = "demo_frontend_alb"    
    }   
}

resource "aws_alb_listener" "frontend_alb_listener" {  
  load_balancer_arn = "${aws_alb.demo_frontend_alb.arn}"  
  port = "80"  
  protocol = "HTTP"
  
  default_action {    
        target_group_arn = "${aws_alb_target_group.frontend_target_group.arn}"
        type = "forward"
  }
}

resource "aws_alb_listener_rule" "frontend_listener_rule" {
    depends_on   = ["aws_alb_target_group.frontend_target_group"]  
    listener_arn = "${aws_alb_listener.frontend_alb_listener.arn}"  
    priority = "1"   
    action {    
        type = "forward"    
        target_group_arn = "${aws_alb_target_group.frontend_target_group.id}"  
    }   
    condition {    
        field  = "path-pattern"    
        values = ["/"]  
    }
}

#resource "aws_alb_listener" "alb-https" {
#    load_balancer_arn = "${aws_alb.demo_internal_alb.arn}"
#    port = "443"
#    protocol = "HTTPS"
#    ssl_policy = "ELBSecurityPolicy-2015-05"
#    certificate_arn = "${var.web_ssl_certificate_id}"
#    default_action {
#        target_group_arn = "${aws_alb_target_group.web.arn}"
#        type = "forward"
#    }
#}

#resource "aws_alb_listener_rule" "api-https" {
#    listener_arn = "${aws_alb_listener.alb-https.arn}"
#    priority = 1
#    action {
#        type = "forward"
#        target_group_arn = "${aws_alb_target_group.api.arn}"
#    }
#    condition {
#        field = "path-pattern"
#        values = ["/api*"]
#    }
#}

#resource "aws_alb_target_group" "web" {
#    name = "web-alb-tg"
#    port = 8080
#    protocol = "HTTP"
#    vpc_id = "${aws_vpc.main.id}"
#    deregistration_delay = 0
#    health_check {
#        healthy_threshold = 2
#        unhealthy_threshold = 2
#        timeout = 3
#        path = "/health/"
#    }
#}
