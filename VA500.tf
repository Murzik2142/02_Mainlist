resource "aws_instance" "va500" {
  ami = "${var.hw_ami}"
  instance_type = "${var.vipnetcooedinator_type2}"
  subnet_id = "${aws_subnet.Public_VPC_Subnet.id}"
  user_data = "${file("${var.va500_init}")}"
  source_dest_check = false
  key_name = "MurzabaevMM"
  tags = {
		Name = "VA500"
	}
}
/*
resource "aws_eip" "eip_va500" {
  instance = "${aws_instance.va500.id}"
  vpc      = true
  tags = {
    Name = "VA500"
  }
}
*/