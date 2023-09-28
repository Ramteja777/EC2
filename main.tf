resource "aws_instance" "demo-server" {
  ami=var.os-name
  key_name=var.key
  instance_type=var.instance-type
  associate_public_ip_address = true
  subnet_id = aws_subnet.demo-subnet-1.id
  vpc_security_group_ids = [ aws_security_group.demo-vpc-sg.id ]
}
