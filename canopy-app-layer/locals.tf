locals {
  aws_region_primary = "us-east-1"
  aws_az_1           = "us-east-1a"
  aws_az_2           = "us-east-1b"
  aws_az_3           = "us-east-1c"

  tags = {
    Name        = "canopy-app-layer"
    Environment = "development" # make this dynamic
  }
}