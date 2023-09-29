# https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
module "canopy_app_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.app_name}-sg"
  description = "Security group for App-server with HTTP ports open within VPC"
  vpc_id      = data.terraform_remote_state.canopy_common.outputs.vpc_id

  ingress_cidr_blocks = ["10.10.0.0/16"]
}