resource "aws_instance" "jenkins" {

  ami           = "ami-01a00762f46d584a1"
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id
  ]

  associate_public_ip_address = true

  tags = {
    Name = "Jenkins-Server"
  }
}