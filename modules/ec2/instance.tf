resource "aws_instance" "prodevans-rocks-sai" {
  ami  = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  key_name= "demokey"
   
  #network_interface_id = "${aws_network_interface.foo.id}"
}
