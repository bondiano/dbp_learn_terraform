# IP
resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.app_server.id
  allocation_id = aws_eip.eip.id
}

# User data
data "ct_config" "config" {
  content = templatefile("${path.module}/config.tpl", {
    key  = var.ssh_key
    user = var.user
  })
  strict  = true
}

# Instance
resource "aws_instance" "app_server" {
  ami           = var.instance_ami
  instance_type = "t2.micro"
  user_data     = data.ct_config.config.rendered

  tags = {
    Name = "Study AppServer"
  }

  vpc_security_group_ids = [
    var.ec2_sg_id
  ]
}
