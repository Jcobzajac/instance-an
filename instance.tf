resource "aws_instance" "instance" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.instance_profile.name}"
  subnet_id = "${var.subnet_id}"
  security_groups = ["${var.security_group}"]
}