# Create the Security Group
resource "aws_security_group" "Vipnet_VPC_SG" {
  vpc_id       = aws_vpc.VPC.id
  name         = "Vipnet_SG"
  description  = "Vipnet SG"
  
  # allow ingress of port UDP 55777
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 0
    to_port     = 55777
    protocol    = "udp"
  } 

 # allow ingress of port TCP tunnel 80
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
  } 

  # allow ingress of port TCP tunnel 443
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 0
    to_port     = 443
    protocol    = "tcp"
  } 
  
  # allow ingress of port TCP tunnel 22
  ingress {
    cidr_blocks = var.ingressCIDRblock  
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
  } 

  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
   Name = "Vipnet VPC_main4 SG"
   Description = "Vipnet VPC_main4 SG"
  }
}