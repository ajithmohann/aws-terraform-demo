output "canopy_common" {
  value = data.terraform_remote_state.canopy_common.outputs.vpc_id
}