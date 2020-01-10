resource "aws_instance" "va100" {
  ami = "${var.hw_ami}"
  instance_type = "${var.vipnetcooedinator_type1}"
  subnet_id = "${aws_subnet.Public_VPC_Subnet.id}"
  user_data = "${file("${var.va100_init}")}"
  source_dest_check = false
  #key_name = "MurzabaevMM"
  tags = {
		Name = "VA100"
	}
}
/*
resource "aws_eip" "eip_va100" {
  instance = "${aws_instance.va100.id}"
  vpc      = true
  tags = {
    Name = "VA100"
  }
}
*/

