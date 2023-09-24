
resource "aws_placement_group" "aws_demo_placement_group" {
  name     = "${var.app_name}-placement-group"
  strategy = "cluster"
}

resource "aws_launch_template" "aws_demo_launch_template" {
  name_prefix   = "${var.app_name}-launch-template"
  image_id      = "ami-1a2b3c"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "aws_demo_autoscaling_group" {
  availability_zones = ["us-east-1a", "us-east-2a"]
  desired_capacity   = 4
  max_size           = 5
  min_size           = 2

  launch_template {
    id      = aws_launch_template.aws_demo_launch_template.id
    version = "$Latest"
  }
}