data "terraform_remote_state" "canopy_common" {
  backend = "local"

  config = {
    path = "../canopy-common/terraform.tfstate.d/canopy-common-dev/terraform.tfstate" # TODO: make the path dynamic for workspace
  }
}