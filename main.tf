provider "aws" {
  region = var.location
}

data "terraform_remote_state" "remote_state" {
  backend = "s3"
  config = {
    bucket         = "s3statebackend1109"
    key            = "global/mystatefile/terraform.tfstate"
    region         = "us-east-1"  # Replace with your bucket's region
    encrypt        = true
    
  }
}


resource "aws_instance" "demo-server" {
  count = var.instance_count
  ami=var.os-name
  key_name=var.key
  instance_type=var.instance-type
  # associate_public_ip_address = true
  subnet_id = data.terraform_remote_state.remote_state.Private_subnet_id
  vpc_security_group_ids = [ data.terraform_remote_state.remote_state.security_group_id ]
}
