resource "aws_instance" "ubuntu" {
  ami             = var.ami
  instance_type   = "t3.medium"
  key_name        = aws_key_pair.madhu.key_name 
  subnet_id       = aws_subnet.public-subnets.0.id
  security_groups = ["${aws_security_group.prod-sg.id}"]
  depends_on = [ aws_key_pair.suresh ]
  tags = {
    Name = "${var.ec2-tags}-New"
  }
  lifecycle {
    ignore_changes = [security_groups]
  }
  root_block_device {
                delete_on_termination = true
                volume_size = 20
              }

}
