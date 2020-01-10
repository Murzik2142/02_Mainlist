resource "aws_instance" "va2000" {
  ami = "${var.hw_ami}"
  instance_type = "${var.vipnetcooedinator_type4}"
  subnet_id = "${aws_subnet.Public_VPC_Subnet.id}"
  user_data = "${file("${var.va2000_init}")}"
  source_dest_check = false
  key_name = "MurzabaevMM"
  tags = {
		Name = "VA2000"
	}
}
/*
resource "aws_eip" "eip_va2000" {
  instance = "${aws_instance.va2000.id}"
  vpc      = true
  tags = {
    Name = "VA2000"
  }
}
*/