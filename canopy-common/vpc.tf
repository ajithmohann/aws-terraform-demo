# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

# VPC
resource "aws_vpc" "canopy_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = "${merge(local.tags, {Name="canopy_vpc"})}"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

# public subnets
resource "aws_subnet" "canopy_public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.canopy_vpc.id
  cidr_block              = element(["10.0.1.0/24", "10.0.2.0/24"], count.index)
  availability_zone       = element([local.aws_az_1, local.aws_az_2], count.index)
  map_public_ip_on_launch = true
  tags = "${merge(local.tags, {Name="canopy_public_subnet"})}"
}


# private subnets
resource "aws_subnet" "canopy_private_subnet" {
  count             = 2
  vpc_id            = aws_vpc.canopy_vpc.id
  cidr_block        = element(["10.0.3.0/24", "10.0.4.0/24"], count.index)
  availability_zone = element([local.aws_az_1, local.aws_az_2], count.index)
  tags = "${merge(local.tags, {Name="canopy_private_subnet"})}"
}

# internet gateway for the public subnet
resource "aws_internet_gateway" "canopy_igw" {
  vpc_id = aws_vpc.canopy_vpc.id
  tags = "${merge(local.tags, {Name="canopy_igw"})}"
}

# Attach the internet gateway to the public subnet
resource "aws_route_table" "canopy_public_route_table" {
  vpc_id = aws_vpc.canopy_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.canopy_igw.id
  }
  tags = "${merge(local.tags, {Name="canopy_public_route_table"})}"
}

# route table association to public subnet
resource "aws_route_table_association" "canopy_public_subnet_association" {
  count          = 2
  subnet_id      = element(aws_subnet.canopy_public_subnet[*].id, count.index)
  route_table_id = aws_route_table.canopy_public_route_table.id
}