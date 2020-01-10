resource "aws_instance" "va1000" {
  ami = "${var.hw_ami}"
  instance_type = "${var.vipnetcooedinator_type3}"
  subnet_id = "${aws_subnet.Public_VPC_Subnet.id}"
  user_data = "${file("${var.va1000_init}")}"
  source_dest_check = false
  #key_name = "MurzabaevMM"
  tags = {
		Name = "VA1000"
	}
}
/*
resource "aws_eip" "eip_va1000" {
  instance = "${aws_instance.va1000.id}"
  vpc      = true
  tags = {
    Name = "VA1000"
  }
}
*/