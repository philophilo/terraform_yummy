resource "aws_autoscaling_group" "demo_auto_scale" {
    launch_configuration = "${aws_launch_configuration.demo_launch_conf.name}"
    availability_zones = ["us-east-2a", "us-east-2b"]
    min_size = 1
    max_size = 2
    enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]
    metrics_granularity = "1Minute"
    target_group_arns = ["${aws_alb_target_group.frontend_target_group.arn}"]
    health_check_type = "EC2"
    tag {
        key = "Name"
        value = "demo_auto_scale"
        propagate_at_launch = true
    }
}

# auto scaling attachment
resource "aws_autoscaling_attachment" "frontend_auto_scale_attach" {
    alb_target_group_arn = "${aws_alb_target_group.frontend_target_group.arn}"
    autoscaling_group_name = "${aws_autoscaling_group.demo_auto_scale.id}"
}

# instance attachment
resource "aws_alb_target_group_attachment" "frontend_target_attach" {
    target_group_arn = "${aws_alb_target_group.frontend_target_group.arn}"
    target_id = "${aws_instance.frontend_ami.id}"  
    port = 8080
}
