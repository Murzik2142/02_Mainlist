# create the VPC
resource "aws_vpc" "VPC" {
  cidr_block           = var.VPCCIDRblock
  instance_tenancy     = var.instanceTenancy 
  enable_dns_support   = var.dnsSupport 
#  enable_dns_hostnames = var.dnsHostNames
  tags = {
    Name = "VPC-main4"
  }
} 

# create Subnets
resource "aws_subnet" "Public_VPC_Subnet" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.VPCpublicsubnetCIDRblock
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone
  tags = {
     Name = "Public VPC-main4 Subnet"
  }
}

resource "aws_subnet" "Private_VPC_Subnet" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.VPCprivatesubnetCIDRblock
  map_public_ip_on_launch = false 
  availability_zone       = var.availabilityZone
  tags = {
     Name = "Private VPC-main4 Subnet"
  }
}

# Create the Internet Gateway
resource "aws_internet_gateway" "VPC_GW" {
 vpc_id = aws_vpc.VPC.id
 tags = {
        Name = "VPC Internet Gateway main4"
 }
}

# Create the Route Table
resource "aws_route_table" "VPC_route_table" {
 vpc_id = aws_vpc.VPC.id
 tags = {
        Name = "VPC-main4 Route Table"
 }
}

# Create the Internet Access
resource "aws_route" "VPC_internet_access" {
  route_table_id         = aws_route_table.VPC_route_table.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.VPC_GW.id
}

/*
## Crete route to Coordinator
resource "aws_route" "VPC_VPN_route" {
  route_table_id         = aws_route_table.VPC_route_table.id
  destination_cidr_block = "11.0.0.0/8"
  instance_id             = aws_instance.vipnet_coordinator_VPC.id
}
*/
resource "aws_route_table_association" "VPC_association" {
  subnet_id      = aws_subnet.Public_VPC_Subnet.id
  route_table_id = aws_route_table.VPC_route_table.id
}
/*
resource "aws_route_table_association" "vpn_route_association" {
  subnet_id      = aws_subnet.Private_VPC_Subnet.id
  route_table_id = aws_route_table.VPC_route_table.id
}
*/
# create the VPC
