# # https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
# module "canopy_app_lb_sg" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${var.app_name}-lb-sg"
#   description = "Security group for App-server with HTTP ports open within VPC"
#   vpc_id      = data.terraform_remote_state.canopy_common.outputs.vpc_id

#   ingress_cidr_blocks = ["10.10.0.0/16"]
#   tags = "${merge(local.tags, {Name="canopy_app_lb_sg"})}"
# }