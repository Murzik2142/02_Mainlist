/*
variable "key_name" {
    default ="MurzabaevMM"
}
*/

resource "aws_key_pair" "MurzabaevMM" {
  key_name   = "MurzabaevMM"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFBKZbZJKq7V8bU2v9SnYlK9Wp+08jA5iI20H0XQC/sH/K318zTFcJ5sTFUmU8owmCYCYKN2pbVov72fMNQe/p42i/bU/YupinbRxax9ykxDa9Wec2a5GMCB6rwT6pHb235+0H5qGgWsR07NoMWu2O6BAWh/HPiF6NU1vcXkkDlHKrUuASb2xY7TOqD/Filb/u+oK9bAapj3ws2q4yXmmFKHkSwIH556LhaT04s530H9Ij1kQyGMeROEbh/BjIn6edpU5NBsF9zTYWYNcYPaB5066bcXEQej+RjrewJoU+vreeT9wAwIiHRpop8n7H2BZcQ2/K7vIE45jh7+Kh79mP MurzabaevMM-Amazon"
}

variable "region" {
    default = "us-west-2"
}

variable "availabilityZone" {
    default = "us-west-2a"
}

variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
  default = true
}
variable "dnsHostName" {
  default = true
}
### VPC

variable "VPCCIDRblock" {
    default = "10.0.0.0/24"
}
variable "VPCpublicsubnetCIDRblock" {
    default = "10.0.0.0/25"
}
variable "VPCprivatesubnetCIDRblock" {
    default = "10.0.0.128/25"
}

### ACL
variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}

### Vipnet Coordinator

variable "hw_ami" {
  default ="ami-08a89a78643dc34a6"
}
variable "vipnetcooedinator_type1" {
    default = "t2.micro"  
}
variable "vipnetcooedinator_type2" {
    #default = "t2.small"
    default = "t2.micro"
}
variable "vipnetcooedinator_type3" {
    #default = "t2.xlarge"
    default = "t2.micro"
}
variable "vipnetcooedinator_type4" {
    #default = "t2.2xlarge"
    default = "t2.micro"  
}
variable "va100_init" {
  default = "/home/ec2-user/Terraform/keys/01/1/user-data.mime"
#  default = "/home/andrey/va100_init"
}
variable "va500_init" {
  default = "/home/ec2-user/Terraform/keys/01/2/user-data.mime"
#  default = "/home/andrey/va500_init"
}
variable "va1000_init" {
  default = "/home/ec2-user/Terraform/keys/01/3/user-data.mime"
# default = "/home/andrey/va1000_init"
}
variable "va2000_init" {
  default = "/home/ec2-user/Terraform/keys/01/4/user-data.mime"
# default = "/home/andrey/va2000_init"
}


