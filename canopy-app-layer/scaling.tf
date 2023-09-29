
#  source - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group

locals {
  private_subnets = data.terraform_remote_state.canopy_common.outputs.private_subnets
}

# placement_group
resource "aws_placement_group" "canopy_app_placement_group" {
  name     = "${var.app_name}-placement-group"
  strategy = "cluster"
  tags     = local.tags
}

# launch-template
resource "aws_launch_template" "canopy_app_launch_template" {
  name_prefix   = "${var.app_name}-launch-template"
  image_id      = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
}

# autoscaling_group
resource "aws_autoscaling_group" "canopy_app_autoscaling_group" {
  # availability_zones  = [local.aws_az_1, local.aws_az_2] can't be used with vpc_zone_identifier 
  vpc_zone_identifier = [for subnet in local.private_subnets : subnet]
  desired_capacity    = 4
  max_size            = 5
  min_size            = 2

  launch_template {
    id      = aws_launch_template.canopy_app_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = local.tags["Name"]
    propagate_at_launch = true
  }
}

# application loab balancer
resource "aws_lb" "canopy_app_lb" {
  name               = "${var.app_name}-loab-balancer"
  internal           = false # TODO: change this to TRUE once tested
  load_balancer_type = "application"
  security_groups    = [module.canopy_app_sg.security_group_id]
  subnets            = [for subnet in local.private_subnets : subnet]

  enable_deletion_protection = true

  tags = {
    Environment = local.tags.Environment
  }
}
