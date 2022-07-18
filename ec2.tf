#Create a new EC2 launch configuration
resource "aws_instance" "ec2_public" {
ami                    = "ami-068257025f72f470d"
instance_type               = "${var.instance_type}"
key_name                    = "${var.key_name}"
security_groups             = ["${aws_security_group.ssh-security-group.id}"]
subnet_id                   = "${aws_subnet.public-subnet-1.id}"
associate_public_ip_address = true
#user_data                   = "${data.template_file.provision.rendered}"
#iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
lifecycle {
create_before_destroy = true
}
tags = {
"Name" = "${var.pubec2-name}"
}

#one for private
resource "aws_instance" "ec2_private" {
ami                    = "ami-068257025f72f470d"
instance_type               = "${var.instance_type}"
key_name                    = "${var.key_name}"
security_groups             = ["${aws_security_group.ssh-security-group.id}"]
subnet_id                   = "${aws_subnet.private-subnet-1.id}"
associate_public_ip_address = false
#user_data                   = "${data.template_file.provision.rendered}"
#iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
lifecycle {
create_before_destroy = true
}
tags = {
"Name" = "${var.priec2-name}"
}



# Copies the ssh key file to home dir
# Copies the ssh key file to home dir
provisioner "file" {
source      = "./${var.key_name}.pem"
destination = "/home/ec2-user/${var.key_name}.pem"
connection {
type        = "ssh"
user        = "ec2-user"
private_key = file("${var.key_name}.pem")
host        = self.public_ip
}
}
//chmod key 400 on EC2 instance
provisioner "remote-exec" {
inline = ["chmod 400 ~/${var.key_name}.pem"]
connection {
type        = "ssh"
user        = "ec2-user"
private_key = file("${var.key_name}.pem")
host        = self.public_ip
}
}
}

#Create a new EC2 launch configuration
resource "aws_instance" "ec2_private" {
#name_prefix                 = "terraform-example-web-instance"
ami                    = "ami-068257025f72f470d"
instance_type               = "${var.instance_type}"
key_name                    = "${var.key_name}"
security_groups             = ["${aws_security_group.webserver-security-group.id}"]
subnet_id                   = "${aws_subnet.private-subnet-1.id}"
associate_public_ip_address = false
#user_data                   = "${data.template_file.provision.rendered}"
#iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
lifecycle {
create_before_destroy = true
}
tags = {
"Name" = "EC2-Private"
}
}