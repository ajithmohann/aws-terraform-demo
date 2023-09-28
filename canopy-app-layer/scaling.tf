
resource "aws_placement_group" "canopy_placement_group" {
  name     = "${var.app_name}-placement-group"
  strategy = "cluster"
  tags     = local.tags
}

resource "aws_launch_template" "canopy_launch_template" {
  name_prefix   = "${var.app_name}-launch-template"
  image_id      = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "canopy_autoscaling_group" {
  availability_zones = var.availability_zones
  desired_capacity   = 4
  max_size           = 5
  min_size           = 2

  launch_template {
    id      = aws_launch_template.aws_demo_launch_template.id
    version = "$Latest"
  }

  tag {
    key   = "Name"
    value = local.tags["Name"]
    propagate_at_launch = true
  }
}